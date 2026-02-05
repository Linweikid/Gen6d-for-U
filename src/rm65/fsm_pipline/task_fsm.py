#! /usr/bin/env python
# -*- coding: utf-8 -*-
import os
import sys
# perception_ws 的 python 包路径
P_WS_PYTHON = "/media/jt/WYM/rm65_assembly/perception_ws/devel/lib/python3/dist-packages"
if P_WS_PYTHON not in sys.path:
    sys.path.append(P_WS_PYTHON)
# ROS 本身的 python 包路径
ROS_PYTHON = "/opt/ros/noetic/lib/python3/dist-packages"
if ROS_PYTHON not in sys.path:
    sys.path.append(ROS_PYTHON)
    
import faulthandler, traceback
faulthandler.enable()

import builtins
import rospy
import numpy as np
from Dexhand_grasping import *
from Dexhand_insert import *
from pose_estimation_pkg.msg import Pose6D
from enum import Enum, auto
from dataclasses import dataclass
from typing import Callable, Optional, Dict, Tuple, List
import tf.transformations as tft
import time

class ArmPoseUDPToROS:
    """
    使用 RealMan UDP 主动上报，在回调里发布 ROS Pose6D
    waypoint.to_dict() keys: ['position', 'quaternion', 'euler']
      - position: [x, y, z]
      - euler:    [rx, ry, rz]  (通常是 rad，但也可能是 deg)
    """
    def __init__(self, arm: RoboticArm,
                 topic="/ee_pose",
                 hz=100,
                 udp_port=8089,
                 target_ip="192.168.1.104",
                 euler_is_degree: bool = False):
        self.arm = arm
        self.topic = topic
        self.hz = hz
        self.udp_port = udp_port
        self.target_ip = target_ip
        self.euler_is_degree = euler_is_degree

        self.pub = rospy.Publisher(self.topic, Pose6D, queue_size=10)
        self._cb_ptr = rm_realtime_arm_state_callback_ptr(self._arm_state_cb)

        # 可选：记录最近一次解析成功的时间，方便排查
        self._last_ok_t = 0.0

    def start(self):
        # 100Hz -> 10ms
        cycle_ms = builtins.max(1, int(round(1000.0 / float(self.hz))))

        custom = rm_udp_custom_config_t()
        custom.joint_speed = 0
        custom.lift_state = 0
        custom.expand_state = 0

        config = rm_realtime_push_config_t(cycle_ms, True, self.udp_port, 0, self.target_ip, custom)

        ret = self.arm.rm_set_realtime_push(config)
        rospy.loginfo(f"[UDP] set_realtime_push ret={ret}, cycle_ms={cycle_ms}, port={self.udp_port}, target={self.target_ip}")

        self.arm.rm_realtime_arm_state_call_back(self._cb_ptr)

    def stop(self):
        try:
            custom = rm_udp_custom_config_t()
            custom.joint_speed = 0
            custom.lift_state = 0
            custom.expand_state = 0
            config = rm_realtime_push_config_t(100, False, self.udp_port, 0, self.target_ip, custom)
            self.arm.rm_set_realtime_push(config)
        except Exception:
            pass

    def _arm_state_cb(self, data):
        try:
            wp = getattr(data, "waypoint", None)
            if wp is None or (not hasattr(wp, "to_dict")):
                return

            d = wp.to_dict()
            if not isinstance(d, dict):
                return

            pos = d.get("position", None)
            eul = d.get("euler", None)

            # ---- position 兼容：dict 或 list/tuple ----
            if isinstance(pos, dict):
                # 你的日志就是这种：{'x':..., 'y':..., 'z':...}
                if not all(k in pos for k in ("x", "y", "z")):
                    rospy.logwarn_throttle(2.0, f"[UDP] bad position dict keys={list(pos.keys())}")
                    return
                x, y, z = float(pos["x"]), float(pos["y"]), float(pos["z"])
            elif isinstance(pos, (list, tuple)) and len(pos) >= 3:
                x, y, z = float(pos[0]), float(pos[1]), float(pos[2])
            else:
                rospy.logwarn_throttle(2.0, f"[UDP] bad position: {pos}")
                return

            # ---- euler 兼容：dict 或 list/tuple ----
            if isinstance(eul, dict):
                # 有的 SDK 会给 {'rx':..,'ry':..,'rz':..} 或 {'x':..,'y':..,'z':..}
                if all(k in eul for k in ("rx", "ry", "rz")):
                    rx, ry, rz = float(eul["rx"]), float(eul["ry"]), float(eul["rz"])
                elif all(k in eul for k in ("x", "y", "z")):
                    rx, ry, rz = float(eul["x"]), float(eul["y"]), float(eul["z"])
                else:
                    rospy.logwarn_throttle(2.0, f"[UDP] bad euler dict keys={list(eul.keys())}")
                    return
            elif isinstance(eul, (list, tuple)) and len(eul) >= 3:
                rx, ry, rz = float(eul[0]), float(eul[1]), float(eul[2])
            else:
                rospy.logwarn_throttle(2.0, f"[UDP] bad euler: {eul}")
                return

            # ---- 角度单位：如果你确认是 degree，就打开这个 ----
            if getattr(self, "euler_is_degree", False):
                rx = rx * 3.141592653589793 / 180.0
                ry = ry * 3.141592653589793 / 180.0
                rz = rz * 3.141592653589793 / 180.0

            msg = Pose6D()
            msg.x, msg.y, msg.z = x, y, z
            msg.rx, msg.ry, msg.rz = rx, ry, rz
            self.pub.publish(msg)

            # 高频不要 print；需要看就限频
            rospy.loginfo_throttle(1.0, f"ee_pose: {x:.3f},{y:.3f},{z:.3f},{rx:.3f},{ry:.3f},{rz:.3f}")

        except Exception as e:
            rospy.logwarn_throttle(1.0, f"[UDP->ROS] callback exception: {e}")




class TaskState(Enum):
    """
    状态机中的所有状态：
        IDLE            等待上位机/键盘开始命令
        MOVE_GRASP      机器人移动并进行抓取（调用 Dexhand_grasping）
        CHECK_TF        查看抓取到的U型管和机械臂末端的相对TF坐标变换
        MOVE_INSERT     移动到插孔预位姿并进行插孔（调用 Dexhand_insert）
        RETRACT         回撤到安全位，判断是否彻底完成任务：没有完成回到IDLE，彻底完成去到END
        END             当前工件流程彻底完成
    """
    IDLE            = auto()
    MOVE_GRASP      = auto()
    CHECK_TF        = auto()
    MOVE_INSERT     = auto()
    RETRACT         = auto()
    END             = auto()
  

@dataclass(frozen=True)
class Transition:
    src: TaskState # 起始状态 eg:TaskState.IDLE
    event: str     # 触发事件 eg:self.dispatch("grasp_ok")
    dst: TaskState # 目标状态
    guard: Optional[Callable[["TaskFSM"], bool]] = None  # 条件
    action: Optional[Callable[["TaskFSM"], None]] = None # 额外动作

class BaseFSM:
    def __init__(self, initial_state: TaskState, transitions: List[Transition]):
        self.state: TaskState = initial_state
        # (src, event) -> [Transition, ...]
        self._table: Dict[Tuple[TaskState, str], List[Transition]] = {}
        for t in transitions:
            self._table.setdefault((t.src, t.event), []).append(t)

    def dispatch(self, event: str) -> bool:
        """
        触发一个事件，根据当前状态 + 事件查表决定转移。
        返回 True 表示发生了合法转移。
        """
        key = (self.state, event)
        candidates = self._table.get(key, [])
        if not candidates:
            rospy.logwarn_throttle(1.0, f"[FSM] No transition: {self.state.name} --({event})--> ?")
            return False

        for t in candidates:
            if t.guard is None or t.guard(self):
                self._do_transition(t, event)
                return True

        # 有候选但 guard 不通过
        rospy.logwarn_throttle(1.0, f"[FSM] Guard blocked: {self.state.name} --({event})--> ...")
        return False

    def _do_transition(self, t: Transition, event: str):
        old = self.state

        # on_exit_<STATE>
        exit_cb = getattr(self, f"on_exit_{old.name}", None)
        if callable(exit_cb):
            exit_cb()

        # 转移动作（可选）
        if t.action is not None:
            t.action(self)

        # 更新状态
        self.state = t.dst

        # on_enter_<STATE>
        enter_cb = getattr(self, f"on_enter_{self.state.name}", None)
        if callable(enter_cb):
            enter_cb()

        rospy.loginfo(f"[FSM] {old.name} --({event})--> {self.state.name}")

class TaskFSM(BaseFSM):
    def __init__(self, robot, task_loop=2):
        # 1) 定义转移关系（整条工艺线）
        transitions = [
            # ----- IDLE -----
            Transition(TaskState.IDLE, "task_start", TaskState.MOVE_GRASP), # 状态1 -> 事件1 -> 状态2

            # ----- MOVE_GRASP -----
            Transition(TaskState.MOVE_GRASP, "move_grasp_ok",     TaskState.CHECK_TF),
            Transition(TaskState.MOVE_GRASP, "move_grasp_failed", TaskState.MOVE_GRASP),

            # ----- CHECK_TF -----
            Transition(TaskState.CHECK_TF, "get_TF_ok",     TaskState.MOVE_INSERT),
            Transition(TaskState.CHECK_TF, "get_TF_failed", TaskState.CHECK_TF),

            # ----- MOVE_INSERT -----
            Transition(TaskState.MOVE_INSERT, "move_insert_ok",     TaskState.RETRACT),
            Transition(TaskState.MOVE_INSERT, "move_insert_failed", TaskState.MOVE_INSERT),

            # ----- RETRACT -> END/IDLE -----
            Transition(TaskState.RETRACT, "task_finish",   TaskState.END),
            Transition(TaskState.RETRACT, "task_continue", TaskState.MOVE_GRASP),
        ]

        super().__init__(TaskState.IDLE, transitions)

        # 2) 初始化
        self.task_loop = task_loop

        self.robot = robot
        self.DexhandGrasping = DexhandGrasping(self.robot)
        self.DexhandInsert = DexhandInsert(self.robot)

        # 视觉输入：零件 & 插孔
        # self.u_pose: Optional[List[float]] = None   # [x,y,z,rx,ry,rz]
        # 抓取粗/精位姿，暂时不用
        self.u_pose_coarse: Optional[List[float]] = None   #抓取粗位姿
        self.u_pose_fine: Optional[List[float]] = None     #抓取精位姿
        # self.h_pose: Optional[List[float]] = None
        self.h_pose_coarse: Optional[List[float]] = None   #插入粗位姿
        self.h_pose_fine: Optional[List[float]] = None     #插入精位姿
        # self.u_pose_sub = rospy.Subscriber("/target_u_pose1", Pose6D, self._u_pose_cb, queue_size=1)
        self.u_pose_coarse_sub = rospy.Subscriber("/target_u_pose_coarse1", Pose6D, self._u_pose_coarse_cb, queue_size=1)
        self.u_pose_fine_sub = rospy.Subscriber("/target_u_pose_fine1", Pose6D, self._u_pose_fine_cb, queue_size=1)
        #self.h_pose_sub = rospy.Subscriber("/target_h_pose1", Pose6D, self._h_pose_cb, queue_size=1)
        self.h_pose_coarse_sub = rospy.Subscriber("/target_h_pose_coarse1", Pose6D, self._h_pose_coarse_cb, queue_size=1)
        self.h_pose_fine_sub = rospy.Subscriber("/target_h_pose_fine1", Pose6D, self._h_pose_fine_cb, queue_size=1)
        self.rate = rospy.Rate(100)
        self.on_enter_IDLE()

    def spin(self):
        """
        只负责让节点活着，让 Subscriber 回调能跑。
        任务流程全在 on_enter_xxx 里推进。
        """
        while not rospy.is_shutdown() and self.state != TaskState.END:
            self.rate.sleep()

    # def _u_pose_cb(self, msg: Pose6D):
    #     self.u_pose = [msg.x, msg.y, msg.z, msg.rx, msg.ry, msg.rz]

    def _u_pose_coarse_cb(self, msg: Pose6D):
        self.u_pose_coarse = [msg.x, msg.y, msg.z, msg.rx, msg.ry, msg.rz]

    def _u_pose_fine_cb(self, msg: Pose6D):
        self.u_pose_fine = [msg.x, msg.y, msg.z, msg.rx, msg.ry, msg.rz]

    # def _h_pose_cb(self, msg: Pose6D):
    #     self.h_pose = [msg.x, msg.y, msg.z, msg.rx, msg.ry, msg.rz]

    def _h_pose_coarse_cb(self, msg: Pose6D):
        self.h_pose_coarse = [msg.x, msg.y, msg.z, msg.rx, msg.ry, msg.rz]

    def _h_pose_fine_cb(self, msg: Pose6D):
        self.h_pose_fine = [msg.x, msg.y, msg.z, msg.rx, msg.ry, msg.rz]

    
    def pose_list_to_mat_rm(self, pose):
        """
        RealMan 姿态 -> 4x4 齐次矩阵
        pose: [x, y, z, rx, ry, rz] (rad)
        R = Rz(rz) @ Ry(ry) @ Rx(rx)   # RealMan 官方约定 ZYX 内旋 / Rz·Ry·Rx
        """
        x, y, z, rx, ry, rz = pose

        cx, sx = np.cos(rx), np.sin(rx)
        cy, sy = np.cos(ry), np.sin(ry)
        cz, sz = np.cos(rz), np.sin(rz)

        Rx = np.array([[1, 0, 0],
                    [0, cx, -sx],
                    [0, sx,  cx]])

        Ry = np.array([[ cy, 0, sy],
                    [  0, 1,  0],
                    [-sy, 0, cy]])

        Rz = np.array([[cz, -sz, 0],
                    [sz,  cz, 0],
                    [ 0,   0, 1]])

        R = Rz @ Ry @ Rx  
        T = np.eye(4)
        T[:3, :3] = R
        T[:3,  3] = [x, y, z]
        return T
    
    def decompose_transform(self, matrix):
        """
        将矩阵转化为位姿
        """
        translation = matrix[:3, 3]
        rotation = matrix[:3, :3]

        # Convert rotation matrix to euler angles (rx, ry, rz)
        sy = np.sqrt(rotation[0, 0] * rotation[0, 0] + rotation[1, 0] * rotation[1, 0])
        singular = sy < 1e-6

        if not singular:
            rx = np.arctan2(rotation[2, 1], rotation[2, 2])
            ry = np.arctan2(-rotation[2, 0], sy)
            rz = np.arctan2(rotation[1, 0], rotation[0, 0])
        else:
            rx = np.arctan2(-rotation[1, 2], rotation[1, 1])
            ry = np.arctan2(-rotation[2, 0], sy)
            rz = 0

        return translation, rx, ry, rz
    
    def T2U_tf(self, u_pose):
        error, state = self.robot.rm_get_current_arm_state()
        if error != 0:
            print(f"[rm_move_to_target] 读取当前位姿失败，错误码: {error}")
            return False
        cur_pose = list(state["pose"])  # [x, y, z, rx, ry, rz]
        # 1. 列出两个齐次矩阵
        T_base_u    = self.pose_list_to_mat_rm(u_pose)   # u 相对于 base
        T_base_tool = self.pose_list_to_mat_rm(cur_pose) # tool 相对于 base
        # 2. 计算 ^u T_tool = (^base T_u)^(-1) * ^base T_tool
        T_u_tool = np.dot(tft.inverse_matrix(T_base_u), T_base_tool) # tool 相对于 U
        # 3. 再转回 [x, y, z, rx, ry, rz] 形式
        trans, rx, ry, rz = self.decompose_transform(T_u_tool)
        tool_in_u_pose = [float(trans[0]), float(trans[1]), float(trans[2]), float(rx), float(ry), float(rz)]

        return tool_in_u_pose
            
    def on_enter_IDLE(self):
        rospy.loginfo("Enter IDLE, waiting for start...")
        # 初始化
        self.u_pose = None
        self.h_pose = None
        self.robot.Move_to_right_home()   # 初始手臂保持下垂
        self.robot.ys_gripper.normal()    # 初始手指张开
        self.dispatch("task_start")
    
    def on_enter_MOVE_GRASP(self):
        rospy.loginfo("Enter MOVE_GRASP, moving to pre-grasp pose")
        #初始代码，检查位姿并执行
        # if self.u_pose is None:
        #     rospy.logwarn("No u_pose when entering MOVE_GRASP, go ERROR")
        #     self.dispatch("move_grasp_failed")

        # 等待有效 u_pose_coarse（非 None 且非全 0）
        while not rospy.is_shutdown():
            if self.u_pose_coarse is not None and len(self.u_pose_coarse) >= 6:
                if any(abs(v) > 1e-6 for v in self.u_pose_coarse[:6]):
                    break
            rospy.logwarn_throttle(2.0, "Waiting for valid u_pose_coarse...")
            time.sleep(3.0)
        # 输入U管粗位姿，移动到上方
        self.robot.Move_to_precatch_home()
        pre_grasp_pose = self.DexhandGrasping.Get_right_tool_pose(*self.u_pose_coarse)
        pre_grasp_status = self.DexhandGrasping.rm_move_to_target_above(pre_grasp_pose)
        if pre_grasp_status is True:
            rospy.loginfo("Move to pre-grasp pose success")
        else:
            self.dispatch("move_grasp_failed")
        # 输入获取的精位姿执行抓取，并返回成功状态
        #grasp_status = self.DexhandGrasping.execute(self.u_pose)
        while not rospy.is_shutdown():
            if self.u_pose_fine is not None and len(self.u_pose_fine) >= 6:
                if any(abs(v) > 1e-6 for v in self.u_pose_fine[:6]):
                    break
            rospy.logwarn_throttle(2.0, "Waiting for valid u_pose_fine...")
            time.sleep(3.0)
        grasp_status = self.DexhandGrasping.execute(self.u_pose_fine)
        if grasp_status is True:
            self.dispatch("move_grasp_ok")
        else:
            self.dispatch("move_grasp_failed")
    
    def on_enter_CHECK_TF(self):
        rospy.loginfo("Enter CHECK_TF, get TF")
        # 加东西 
        # # 执行一段轨迹，让手可以将U型管的位置转到胸口相机处
        # right_camera_joint = [6.7,-90,0,90,0,-90]
        # error_code = self.robot.rm_movej(right_camera_joint, v=20, r=50, connect=0, block=1)
        # self.TF_status = self.T2U_tf(self.u_pose)
        self.TF_status = [0.077, 0.035, -0.158, 0, 0, 0]
        if self.TF_status is not False:
            self.dispatch("get_TF_ok")
        else:
            self.dispatch("get_TF_failed")
    
    def on_enter_MOVE_INSERT(self):
        rospy.loginfo("Enter MOVE_INSERT, moving to insert pose")
        #初始代码，检查位姿并执行
        # if self.h_pose is None:
        #     rospy.logwarn("No h_pose when entering MOVE_INSERT, go ERROR")
        #等待输入有效的粗插入位姿h_pose_coarse（非 None 且非全 0）
        while not rospy.is_shutdown():
            if self.h_pose_coarse is not None and len(self.h_pose_coarse) >= 6:
                if any(abs(v) > 1e-6 for v in self.h_pose_coarse[:6]):
                    break
            rospy.logwarn_throttle(2.0, "Waiting for valid h_pose_coarse...")
            time.sleep(3.0)
        #移动到粗插入位姿上方
        self.robot.Move_to_assemble_home()
        pre_insert_pose = self.DexhandInsert.get_right_tool_pose(self.h_pose_coarse, self.TF_status)
        pre_insert_status = self.DexhandInsert.rm_move_to_above(pre_insert_pose, hover=0.1, start_safe_X=0.05)
        if pre_insert_status is True:
            rospy.loginfo("Move to pre-insert pose success")
        else:
            self.dispatch("move_insert_failed")
        # 等待获取精位姿
        while not rospy.is_shutdown():
            if self.h_pose_fine is not None and len(self.h_pose_fine) >= 6:
                if any(abs(v) > 1e-6 for v in self.h_pose_fine[:6]):
                    break
            rospy.logwarn_throttle(2.0, "Waiting for valid h_pose_fine...")
            time.sleep(3.0)
        insert_status = self.DexhandInsert.execute(self.h_pose_fine, self.TF_status)
        if insert_status is True:
            self.dispatch("move_insert_ok")
        else:
            self.dispatch("move_insert_failed")
    
    def on_enter_RETRACT(self):
        rospy.loginfo("Enter RETRACT, return to pre catch home")
        self.robot.ys_gripper.normal()
        self.robot.Move_to_precatch_home()
        self.task_loop = self.task_loop-1
        if self.task_loop == 0:
            self.dispatch("task_finish")
        else:
            self.dispatch("task_continue")
    
    def on_enter_END(self):
        rospy.loginfo("Enter END, return to home")
        # self.robot.Move_to_middle()#保证安全的中间位置
        # self.robot.Move_to_assemble_home()#先退一步
        #以上两步实际不需要=_=
        self.robot.Move_to_right_home()#完全归位

def safe_close(robot):
    # 先关手（Modbus）
    try:
        if getattr(robot, "ys_gripper", None):
            robot.ys_gripper.disconnect()
    except Exception:
        pass
    # 再关臂（RM SDK）
    try:
        robot.disconnect_robot()
    except Exception:
        pass
    
def main():
    """
    必须按照下面顺序执行初始化，否则会出现 core dump
    原因是 退出阶段资源释放顺序、后台线程收尾冲突 (RM的SDK + rospy的XMLRPC/TCPROS线程 + socket/pymodbus)
    """
    # 先硬件（此时还没 rospy 的后台线程）
    robot = RM65_6F(robot_ip="192.168.1.19", port=8080, is_use_ys_gripper=True)
    # 再启动 ROS
    rospy.init_node("task_fsm", anonymous=True, disable_signals=True)

    # === 启动  UDP -> ROS 发布器 ===
    # udp_pub = ArmPoseUDPToROS(
    #     arm=robot.robot,
    #     topic="/ee_pose",
    #     hz=100,          
    #     udp_port=8089,
    #     target_ip="192.168.1.104"   # 这里写“运行 ROS 节点的那台电脑 IP”
    # )
    # udp_pub.start()
    time.sleep(5)
    
    # 如果有线程错误，打印线程错误
    try:
        # 创建状态机实例（比如一共插 2 个工件）
        fsm = TaskFSM(robot=robot, task_loop=10)
    except Exception:
        traceback.print_exc()
        raise
 
    try:
        rospy.loginfo("Task FSM running...")
        # 持续 spin，直到状态走到 END
        fsm.spin()
    except KeyboardInterrupt:
        pass
    
    finally:
        # try:
        #     # udp_pub.stop()
        # except Exception:
        #     pass
        
        try:
            rospy.signal_shutdown("done")
        except Exception:
            pass
        time.sleep(0.3)

        safe_close(robot)
        time.sleep(0.2)
    rospy.loginfo("All tasks finished, exit.")
    
if __name__ == "__main__":
    try:
        main()
    except rospy.ROSInterruptException:
        pass
