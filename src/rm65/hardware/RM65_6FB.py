# ! /usr/bin/env python
# -*- coding: utf-8 -*-
import csv
import time
import datetime
import numpy as np
import threading
from queue import Queue, Empty
from pathlib import Path
from scipy.spatial.transform import Rotation as R
from .rh_hand_RH56DFTP_2R import *
#from .rh_hand_RH56DFTP_0RL import *
#from .gravity_compensation import *
from .RM_API2.Python.Robotic_Arm.rm_robot_interface import * 

class ForceSampler:
    """
    高频采集 RM 六维力/力矩 + 姿态，并实时写 CSV
    """
    def __init__(self, robot,
                 hz: float = 60.0,
                 csv_path: str  = None,
                 queue_size: int = 256):
        self.robot = robot
        self.hz = hz
        self.period = 1.0 / hz
        self.q = Queue(maxsize=queue_size)
        self._stop = threading.Event()
        self._thread = threading.Thread(target=self._run, daemon=True)
        #self._gc = GravityCompensation()
        self._gc = 0

        # -------- CSV --------
        if csv_path is None:
            csv_path = f"rm_force_{time.strftime('%Y%m%d_%H%M%S')}.csv"
        self.csv_path = Path(csv_path).expanduser().resolve()
        self._csv_file = None     # 线程内打开
        self._csv_writer = None

    # ---------- 单帧采样 ----------
    def _read_once(self):
        tag, force_dict = self.robot.rm_get_force_data()
        if tag != 0:
            raise RuntimeError(f"rm_get_force_data 失败，错误码 {tag}")
        rm_ft = list(force_dict["force_data"])          # 原始 [Fx, Fy, Fz, Mx, My, Mz]

        _, state = self.robot.rm_get_current_arm_state()
        pose = list(state["pose"])                      # [x, y, z, rx, ry, rz]

        # 重力补偿
        force_ex  = self._gc.Solve_Force (rm_ft[:3], pose[3:])
        torque_ex = self._gc.Solve_Torque(rm_ft[3:],  pose[3:])
        rm_real_ft = [*force_ex, *torque_ex]

        ts = datetime.datetime.now().strftime("%Y-%m-%dT%H:%M:%S.%f")
        return {
            "timestamp": ts,
            "pose": pose,
            "force_raw": rm_ft,
            "force": rm_real_ft
        }

    # ---------- 线程控制 ----------
    def start(self):
        if self._thread.is_alive():
            return
        self._stop.clear()
        self._thread.start()

    def stop(self):
        self._stop.set()
        self._thread.join(timeout=2)

    def _run(self):
        # 打开文件、写表头
        self.csv_path.parent.mkdir(parents=True, exist_ok=True)
        self._csv_file   = self.csv_path.open("w", newline="")
        self._csv_writer = csv.writer(self._csv_file)
        header = ["timestamp", "x", "y", "z", "rx", "ry", "rz",
                  "Fx_raw", "Fy_raw", "Fz_raw", "Mx_raw", "My_raw", "Mz_raw",
                  "Fx", "Fy", "Fz", "Mx", "My", "Mz"]
        self._csv_writer.writerow(header)
        self._csv_file.flush()

        next_tick = time.perf_counter()
        while not self._stop.is_set():
            try:
                pkt = self._read_once()
                # 队列给 GUI / 其他线程用
                try:
                    self.q.put_nowait(pkt)
                except:
                    pass

                # 写 CSV
                p = pkt["pose"]; fr = pkt["force_raw"]; fc = pkt["force"]
                row = [pkt["timestamp"], *p, *fr, *fc]
                self._csv_writer.writerow(row)
                # 为避免频繁 flush 可改为每 N 帧 flush 一次
                self._csv_file.flush()
            except Exception as e:
                print("采样异常:", e)

            next_tick += self.period
            sleep_time = next_tick - time.perf_counter()
            if sleep_time > 0:
                time.sleep(sleep_time)
            else:
                next_tick = time.perf_counter()

        # 清理
        self._csv_file.close()

    # ---------- Helper ----------
    def get_latest(self, timeout=0.01):
        latest = None
        while True:
            try:
                latest = self.q.get(timeout=timeout)
            except Empty:
                break
        return latest

    def __del__(self):
        if self._thread.is_alive():
            self.stop()


class RM65_6F:
    """
    每次都重新初始化线程模式，相当于把 SDK 的多连接管理“重置/覆盖”了，所以第二次连接又从 1 开始，同时还可能把前一次连接顶掉，进而出现 disconnected 报错
    """
    _thread_mode_inited = False  # 类变量：本进程只初始化一次线程模式
    
    def __init__(self, robot_ip = "192.168.1.19", port = 8080, is_use_ys_gripper = True, sample_hz: float = 60.0, csv_path: str = None, is_use_force_sampler = False):
        """
            右臂:robot_ip = "192.168.1.19"
            左臂:robot_ip = "192.168.1.18"
        """
        # 机械臂配置
        self.robot = self.connect_robot(robot_ip, port, level=3, mode=2)

        self.is_use_ys_gripper = is_use_ys_gripper
        self.is_use_force_sampler = is_use_force_sampler

        # 采集设置
        if(self.is_use_force_sampler):
            self.sampler = ForceSampler(self.robot, hz=sample_hz, csv_path=csv_path)

        # 末端夹爪设置
        if(self.is_use_ys_gripper):
            self.ys_gripper = RH56DFTP_hand()
    
    # ---- 低层 API 透传给外部 ----
    def rm_get_current_arm_state(self, *args, **kwargs):
        return self.robot.rm_get_current_arm_state(*args, **kwargs)

    def rm_movep_canfd(self, *args, **kwargs):
        return self.robot.rm_movep_canfd(*args, **kwargs)
    
    def rm_movel(self, *args, **kwargs):
        return self.robot.rm_movel(*args, **kwargs)

    def connect_robot(self, ip, port, level=3, mode=None):
        """
        Connect to the robot arm.

        Args:
            ip (str): IP address of the robot arm.
            port (int): Port number.
            level (int, optional): Connection level. Defaults to 3.
            mode (int, optional): Thread mode as an integer (0: single, 1: dual, 2: triple). Defaults to None.

        Returns:
            RoboticArm: Instance of the connected RoboticArm.
        """
        # if mode is not None:
        #     thread_mode = rm_thread_mode_e(mode)
        #     robot = RoboticArm(thread_mode)
        # else:
        #     robot = RoboticArm()
         # 关键：只初始化一次线程模式
        if mode is not None and not RM65_6F._thread_mode_inited:
            robot = RoboticArm(rm_thread_mode_e(mode))   # 第一次：TRIPLE
            RM65_6F._thread_mode_inited = True
        else:
            robot = RoboticArm()                         # 第二次开始：不要传线程模式

        handle = robot.rm_create_robot_arm(ip, port, level)

        if handle.id == -1:
            print("\nFailed to connect to the robot arm\n")
            exit(1)
        else:
            print(f"\nSuccessfully connected to the robot arm: {handle.id}\n")

        print("机械臂ID：", handle.id)
        software_info = robot.rm_get_arm_software_info()
        if software_info[0] == 0:
            print("\n================== Arm Software Information ==================")
            print("Arm Model: ", software_info[1]['product_version'])
            print("Algorithm Library Version: ", software_info[1]['algorithm_info']['version'])
            print("Control Layer Software Version: ", software_info[1]['ctrl_info']['version'])
            print("Dynamics Version: ", software_info[1]['dynamic_info']['model_version'])
            print("Planning Layer Software Version: ", software_info[1]['plan_info']['version'])
            print("==============================================================\n")
        else:
            print("\nFailed to get arm software information, Error code: ", software_info[0], "\n")

        return robot
    
    def disconnect_robot(self):
        """
        Disconnect from the robot arm.

        Args:
            robot (RoboticArm): Instance of the RoboticArm.

        Returns:
            None
        """
        handle = self.robot.rm_delete_robot_arm()
        if handle == 0:
            print("\nSuccessfully disconnected from the robot arm\n")
        else:
            print("\nFailed to disconnect from the robot arm\n")

    """
        装配时的预装配姿态[1.570, 0, -3.024]
        抓取时的预抓取姿态[3.141, 0, -3.024]
            考虑：joint0 = [96.7,0,90,0,90,-90]
        catch_target_pose = [0.201889, -0.295322, 0.220089, 3.141, 0, -3.024]
        # target_pose = [0.201889, -0.295322, 0.215609, 3.141, 0, -3.024] 另外一种抓取，考虑食指不磨损
    """
    def Move_to_right_home(self):
        right_home_joint = [6.7,-90,0,90,0,-90]
        error_code = self.robot.rm_movej(right_home_joint, v=20, r=50, connect=0, block=1)
        return error_code
    
    def Move_to_precatch_home(self):
        right_home_joint = [20,3.3,-91,91,-80,-180]
        # right_home_joint = [6.7,0,-90,90,-90,-180]
        error_code = self.robot.rm_movej(right_home_joint, v=20, r=50, connect=0, block=1)
        return error_code
    #middle_joint是为了防止抓取后收回时碰撞设置的一个中间位置
    def Move_to_middle(self):
        middle_joint = [90,0,-90,90,0,-180]
        error_code = self.robot.rm_movej(middle_joint, v=20, r=50, connect=0, block=1)
        return error_code
    
    # def Move_to_after_insert_pose(self):#硬编码的插入后退回位姿，主要用于测试
    #     after_insert_pose = [26.636,-79.124,-88.985,112.070,-82.743,-259.512]
    #     error_code = self.robot.rm_movej(after_insert_pose, v=20, r=50, connect=0, block=1)
    #     return error_code

    def Move_to_assemble_home(self):
        right_home_joint = [6.7,0,-90,90,-90,-180]
        error_code = self.robot.rm_movej(right_home_joint, v=20, r=50, connect=0, block=1)
        return error_code
    
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
    
    def Get_right_tool_pose(self, x, y, z, rx, ry, rz, cam_ser):
        """
        输入:深度相机识别到的物体位姿（x, y, z, rx, ry, rz）
        输出:机械臂末端(不包含灵巧手)相对于base的位姿（x, y, z, rx, ry, rz）
        """
        if cam_ser == 1:
            self.rotation_matrix = np.array( [[-0.01442686, 0.99453937, -0.1033601],
                            [0.02429469, 0.103689, 0.99431301],
                            [ 0.99960074, 0.01183372, -0.02565793]])
            self.translation_vector = np.array([0.07568054, 0.08802729, -0.1477706])
        elif cam_ser == 2:
            self.rotation_matrix = np.array( [[-0.04691238, 0.73709854, 0.674155],
                            [0.01671275, 0.67538278, -0.73727796],
                            [-0.99875919, -0.02332048, -0.04400276]])
            self.translation_vector = np.array([0.03530061, 0.769878, 0.12387077])
        T_tool2end = np.array([
                [1.0, 0, 0, 0.077],
                [0, 1.0, 0, 0.035],
                [0, 0, 1.0, -0.158],
                [0, 0, 0, 1]
            ])
        # 深度相机识别物体返回的坐标
        obj_camera_coordinates = np.array([x, y, z, rx, ry, rz])
        
         # 将旋转矩阵和平移向量转换为齐次变换矩阵
        T_camera_to_base_effector = np.eye(4)
        T_camera_to_base_effector[:3, :3] = self.rotation_matrix
        T_camera_to_base_effector[:3, 3] = self.translation_vector
        
        # 计算物体相对于机械臂基座的位姿
        # 物体相对于相机的位姿转换为齐次变换矩阵
        position2 = obj_camera_coordinates[:3]
        orientation2 = R.from_euler('xyz', obj_camera_coordinates[3:], degrees=False).as_matrix()

        T_object_to_camera_effector = np.eye(4)
        T_object_to_camera_effector[:3, :3] = orientation2
        T_object_to_camera_effector[:3, 3] = position2

        obj_base_effector = T_camera_to_base_effector.dot(T_object_to_camera_effector)
        T_tool_to_base = obj_base_effector.dot(T_tool2end)
        print(obj_base_effector)
        print(T_tool_to_base)
        result = self.decompose_transform(T_tool_to_base)
        target_pose = list(result[0]) + list(result[1:])
        return target_pose
    
    def Grasp_obj(self, obj_pose):
        self.Move_to_assemble_home()
        self.ys_gripper.pre_catch()
        
        tool2base = self.Get_right_tool_pose(*obj_pose)
        step1_pose = [tool2base[0]-0.05, tool2base[1], tool2base[2], tool2base[3], tool2base[4], tool2base[5]] # 高度在目标高度向上5cm处
        error = self.robot.rm_movel(step1_pose, v=20, r=50, connect=0, block=1)
        print(error)
        error = self.robot.rm_movel(tool2base, v=20, r=50, connect=0, block=1)
        print(error)
        self.ys_gripper.catch()
        
        self.robot.rm_movel(step1_pose, v=20, r=50, connect=0, block=1)
        self.ys_gripper.pre_catch()

        self.Move_to_assemble_home()
        return True

    def assemble_obj(self, dynamic_obj_pose):
        tool2base = self.Get_right_tool_pose(*dynamic_obj_pose)
        error = self.robot.rm_movep_canfd(tool2base, follow=True, trajectory_mode=0, radio=0)
        print(error)
        return True
    
    def rm_force(self):
        """
        读取原始六维力数据 
        """
        tag, force_dict = self.robot.rm_get_force_data()
        if tag != 0:                                  # 0 代表成功，其余见 docstring
            raise RuntimeError(f"rm_get_force_data 失败，错误码 {tag}")
        
        rm_ft = list(force_dict["force_data"])      # -> [Fx, Fy, Fz, Mx, My, Mz]
        error, state = self.robot.rm_get_current_arm_state()
        pose = list(state["pose"])      # -> [x, y, z, rx, ry, rz]
        return rm_ft, pose

    def rm_force_compensation(self):
        """
        读取末端位姿 和 补偿后六维力数据
        """
        tag, force_dict = self.robot.rm_get_force_data()
        if tag != 0:                                  # 0 代表成功，其余见 docstring
            raise RuntimeError(f"rm_get_force_data 失败，错误码 {tag}")
        
        rm_ft = list(force_dict["force_data"])      # -> [Fx, Fy, Fz, Mx, My, Mz]
        # print("实时六维力/力矩:", rm_ft)
        
        force_data = [rm_ft[0], rm_ft[1], rm_ft[2]]
        torque_data = [rm_ft[3], rm_ft[4], rm_ft[5]]

        # force_data = [rm_ft[0]-20.10700035095215, rm_ft[1]+9.050999641418457, rm_ft[2]-1.3029999732971191] # 测试
        # torque_data = [rm_ft[3]-0.06199999898672104, rm_ft[4]+0.24899999797344208, rm_ft[5]+0.06300000101327896] # 测试

        error, state = self.robot.rm_get_current_arm_state()
        pose = list(state["pose"])      # -> [x, y, z, rx, ry, rz]
        euler_data = [pose[3], pose[4], pose[5]]
        #g_c = GravityCompensation()
        g_c = 0
        Force_ex = g_c.Solve_Force(force_data, euler_data)
        Torque_ex = g_c.Solve_Torque(torque_data, euler_data)
        rm_real_ft = [*Force_ex, *Torque_ex]
        # rm_real_ft = [*force_data, *torque_data] # 测试
        return rm_real_ft, pose

    def rm_tool_zero_force_data(self):
        """
        读取示教器自动重力补偿后六维力数据 和 末端位姿
        """
        tag, force_dict = self.robot.rm_get_force_data()
        if tag != 0:                                  # 0 代表成功，其余见 docstring
            raise RuntimeError(f"rm_get_force_data 失败，错误码 {tag}")
        error, state = self.robot.rm_get_current_arm_state()
        if error != 0:                                  # 0 代表成功，其余见 docstring
            raise RuntimeError(f"rm_get_current_arm_state 失败，错误码 {tag}")
        
        rm_ft = list(force_dict["tool_zero_force_data"])      # -> [Fx, Fy, Fz, Mx, My, Mz]
        pose = list(state["pose"])      # -> [x, y, z, rx, ry, rz]

        return rm_ft, pose
    
    # # ===== 示教数据采集 =====
    # def get_arm_state(self):
    #     """
    #     返回:
    #         qpos: [arm_dof]
    #         qvel: [arm_dof]
    #         effort: [arm_dof]
    #     """
    #     error, state = self.robot.rm_get_current_arm_state()
    #     qpos = [math.radians(deg) for deg in list(state["joint"])]
    #     qvel = [0, 0, 0, 0, 0, 0]
    #     effort = [0, 0, 0, 0, 0, 0]
    #     return qpos, qvel, effort

    # def get_ee_pose(self):
    #     """
    #     返回末端位姿: [x, y, z, qx, qy, qz, qw]
    #     """
    #     error, state = self.robot.rm_get_current_arm_state()
    #     pose = list(state["pose"])      # -> [x, y, z, rx, ry, rz]
    #     return pose

    # def get_wrench(self):
    #     """
    #     返回六维力: [fx, fy, fz, tx, ty, tz]
    #     """
    #     tag, force_dict = self.robot.rm_get_force_data()
    #     if tag != 0:                                  # 0 代表成功，其余见 docstring
    #         raise RuntimeError(f"rm_get_force_data 失败，错误码 {tag}")
    #     rm_ft = list(force_dict["tool_zero_force_data"])      # -> [Fx, Fy, Fz, Mx, My, Mz]
    #     return rm_ft
    
    # def get_base_vel(self):
    #     """
    #     返回底座速度: [vx, wz]
    #     """
    #     base_vel = np.zeros(2, dtype=np.float32)
    #     return base_vel
    
    # def get_hand_state(self):
    #     """
    #     返回灵巧手:
    #         hand_qpos: [hand_dof]
    #         hand_force: [hand_dof]
    #     """
    #     hand_qpos = self.ys_gripper.read6('angleAct')
    #     hand_force = self.ys_gripper.read6('forceAct')
    #     # hand_qpos = np.zeros(self.hand_dof, dtype=np.float32)
    #     # hand_force = np.zeros(self.hand_dof, dtype=np.float32)
    #     return hand_qpos, hand_force

    # def get_hand_tactile(self):
    #     """
    #     返回触觉向量: [tactile_dim]
    #     """
    #     index_register_values = self.ys_gripper.read_register_range(
    #         self.ys_gripper.TOUCH_SENSOR_BASE_ADDR_INDEX,
    #         self.ys_gripper.TOUCH_SENSOR_END_ADDR_INDEX
    #     )

    #     thumb_register_values = self.ys_gripper.read_register_range(
    #         self.ys_gripper.TOUCH_SENSOR_BASE_ADDR_THUMB,
    #         self.ys_gripper.TOUCH_SENSOR_END_ADDR_THUMB
    #     )

    #     # 格式化数据
    #     index_formatted = self.ys_gripper.format_finger_data("食指", index_register_values)
    #     thumb_formatted = self.ys_gripper.format_finger_data("大拇指", thumb_register_values)

    #     index_tip_end = list(index_formatted["tip_end"])    
    #     index_tip_touch = list(index_formatted["tip_touch"]) 

    #     thumb_tip_end = list(thumb_formatted["tip_end"])    
    #     thumb_tip_touch = list(thumb_formatted["tip_touch"]) 

    #     # 按固定顺序 flatten + 拼接
    #     tactile_raw = np.concatenate([
    #         index_tip_end.reshape(-1),      # 9
    #         index_tip_touch.reshape(-1),    # 96
    #         thumb_tip_end.reshape(-1),      # 9
    #         thumb_tip_touch.reshape(-1),    # 96
    #     ], axis=0)   # (210,)

    #     # 真实触觉数据
    #     tactile = np.zeros(tactile_raw, dtype=np.float32)
    #     return tactile


    
    # ===== 采样便捷接口 =====
    def start_sampling(self):
        self.sampler.start()
        print(f"采样已启动，数据写入 {self.sampler.csv_path}")

    def stop_sampling(self):
        self.sampler.stop()
        print(f"采样停止，CSV 位于 {self.sampler.csv_path}")

    def latest_force(self):
        pkt = self.sampler.get_latest()
        return pkt["force"] if pkt else None

    def __del__(self):
        try:
            self.stop_sampling()
        except Exception:
            pass
    
    # def get_obj(self):
    #     rh.Move_to_precatch_home()
    #     rh.ys_gripper.pre_catch()
        
    #     target_pose = [0.313667, -0.101349, 0.216692, 3.141, 0, -3.024]
    #     rh.robot.rm_movel(target_pose, v=20, r=50, connect=0, block=1)
        
    #     rh.ys_gripper.catch()
    #     rh.robot.rm_movel([0.213667, -0.101349, 0.216692, 3.141, 0, -3.024], v=20, r=50, connect=0, block=1)
    #     return True
        
    # def assemble_obj(self):
    #     rh.Move_to_assemble_home()

    #     pose = [0.189771, 0.426643, 0.132271, 1.57, 0, -3.024]
    #     rh.robot.rm_movel(pose, v=20, r=50, connect=0, block=1)
    
    #     target_pose = [0.230482, 0.433141, 0.133303, 1.57, 0, -3.024]
    #     rh.robot.rm_movel(target_pose, v=10, r=50, connect=0, block=1)
        
    #     assebmle_end_pose = [0.235991, 0.433141, 0.133303, 1.57, 0, -3.024]
    #     rh.robot.rm_movel(assebmle_end_pose, v=10, r=50, connect=0, block=1)
        
    #     rh.ys_gripper.pre_catch()
        
    #     end_pose = [0.109771, 0.433141, 0.133303, 1.57, 0, -3.024]
    #     rh.robot.rm_movel(end_pose, v=20, r=50, connect=0, block=1)
        
    #     rh.Move_to_assemble_home()
    #     return True
    
if __name__ == "__main__":
    import csv
    import time
    import datetime
    import numpy as np
    import threading
    from queue import Queue, Empty
    from pathlib import Path
    from scipy.spatial.transform import Rotation
    from scipy.spatial.transform import Rotation as R
    from rh_hand_RH56DFTP_2R import *
    from gravity_compensation import *
    from RM_API2.Python.Robotic_Arm.rm_robot_interface import * 
    from realsense_camera import Camera
    
    rh = RM65_6F(robot_ip="192.168.1.19", port=8080, is_use_ys_gripper = False, sample_hz = 60, csv_path="media/jt/WYM2/assembly_project/src/data_collect/assemble_force_data1.csv")

    # error, state = rh.robot.rm_get_current_arm_state()
    # print(state)
    # qpos = [math.radians(deg) for deg in list(state["joint"])]
    # print(qpos)
    force, pose = rh.rm_tool_zero_force_data()
    print("latest force:", force)
    print("latest pose :", pose)

    
    # # 机器人位姿状态初始化
    # rh.Move_to_right_home()
    # rh.ys_gripper.normal()

    # # 数据采集多线程执行
    # stop_evt = threading.Event()
    # t_heat = threading.Thread(
    #     target=rh.ys_gripper.read_multiple_registers_map,
    #     kwargs=dict(duration_sec=0,        # 无限，等 stop_evt
    #                 target_hz=120,          # 100 Hz 采样 / 刷新
    #                 gui_fps=30,
    #                 save_png_every=0),      # 每 0 s 截一张图
    #                 demon=True                 # 可选：主进程退出自动杀线程
    # )
    # t_heat.start()
    # rh.start_sampling()
    rh.Move_to_precatch_home()

    # """
    # 6D抓取定义接口如下：
    #     obj_pose = [x, y, z, roll ,pitch, yaw]
    #     rh.Grasp_obj(*obj_pose)
    # """

    # """
    # 装配接口定义如下：
    # while task_flag:
    #     dynamic_obj_pose = [x, y, z, roll ,pitch, yaw]
    #     assemble_obj(dynamic_obj_pose)
    #     task_flag = assemble_state_estimate_model()
    # """

    # rh.get_obj()
    # rh.assemble_obj()
    
    # rh.ys_gripper.normal()
    # rh.Move_to_right_home()
    
    # # 关闭多线程          
    # stop_evt.set()      
    # rh.stop_sampling()
    rh.disconnect_robot()

