#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import sys
CURRENT_DIR = os.path.dirname(os.path.abspath(__file__)) # 当前文件所在目录: .../rm65_assembly/fsm_pipline
PROJECT_ROOT = os.path.dirname(CURRENT_DIR) # 工程根目录: .../rm65_assembly
if PROJECT_ROOT not in sys.path: # 把工程根目录加入 sys.path，后面就可以 `import hardware` 了
    sys.path.insert(0, PROJECT_ROOT)

import time
import builtins
import numpy as np
from hardware.RM65_6FB import *
from scipy.spatial.transform import Rotation as R

class DexhandGrasping(object):
    def __init__(self, robot, dt=0.01):
        self.robot = robot
        self.dt = dt
    
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

    def Get_right_tool_pose(self, x, y, z, rx, ry, rz):
        """
        输入:深度相机识别到的物体位姿相对于base（x, y, z, rx, ry, rz）
        输出:机械臂末端(不包含灵巧手)相对于base的位姿（x, y, z, rx, ry, rz）
        """
        T_tool2end = np.array([
                [1.0, 0, 0, 0.077],
                [0, 1.0, 0, 0.035],
                [0, 0, 1.0, -0.158],
                [0, 0, 0, 1]
            ])
        obj_base_coordinates = np.array([x, y, z, rx, ry, rz])
        
        # 物体相对于机械臂基座的位姿转换为齐次变换矩阵
        position2 = obj_base_coordinates[:3]
        orientation2 = R.from_euler('xyz', obj_base_coordinates[3:], degrees=False).as_matrix()

        T_object_to_base_effector = np.eye(4)
        T_object_to_base_effector[:3, :3] = orientation2
        T_object_to_base_effector[:3, 3] = position2

        T_tool_to_base = T_object_to_base_effector.dot(T_tool2end)
        # print(T_tool_to_base)
        result = self.decompose_transform(T_tool_to_base)
        target_pose = list(result[0]) + list(result[1:])
        return target_pose
    
    def rm_move_to_target(self, target_pose) -> bool:
        """
        规划并执行：当前 -> 上抬到安全高度 -> 平移到目标正上方 -> 旋转至目标姿态 -> 下到目标位置。
        返回 True/False。
        """
        # 1. 读取当前位姿并验证
        error, state = self.robot.rm_get_current_arm_state()
        if error != 0:
            print(f"[rm_move_to_target] 读取当前位姿失败，错误码: {error}")
            return False
        cur_pose = list(state["pose"])  # [x, y, z, rx, ry, rz]
        
        # 2. 提取并转换坐标（确保使用Python原生float）
        try:
            # 当前位姿 
            cur_x, cur_y, cur_z = map(float, cur_pose[:3]) 
            cur_rx, cur_ry, cur_rz = map(float, cur_pose[3:])

            # 目标位姿 
            tgt_x, tgt_y, tgt_z = map(float, target_pose[:3]) 
            tgt_rx, tgt_ry, tgt_rz = map(float, target_pose[3:])
        except (IndexError, ValueError) as e:
            print(f"[rm_move_to_target] 位姿数据解析失败: {str(e)}")
            return False
        
        # 3. 计算关键高度参数
        safe_X = cur_x - 0.01  # 安全高度（额外加1cm冗余）
        
        # 4. 生成四段式路点
        # 路点1: 竖直上抬到安全高度（保持当前姿态）
        wp1 = [safe_X, cur_y, cur_z, cur_rx, cur_ry, cur_rz]
        # 路点2: 在安全高度平面平移到目标XY位置（保持当前姿态）
        wp2 = [safe_X, tgt_y, tgt_z, cur_rx, cur_ry, cur_rz]
        # 路点3: 在安全高度旋转至目标姿态（保持YZ位置和高度）
        wp3 = [safe_X, tgt_y, tgt_z, tgt_rx, tgt_ry, tgt_rz]
        # 路点4: 下落到目标位置（保持目标姿态）
        wp4 = [tgt_x, tgt_y, tgt_z, tgt_rx, tgt_ry, tgt_rz]

        # 5. 执行基于距离的线性插补运动
        waypoints = [
            (cur_pose, wp1, "上抬"),
            (wp1, wp2, "平移"),
            (wp2, wp3, "旋转"),
            (wp3, wp4, "下落")
        ]
        
        # 设定每步最大移动距离（平移和旋转）
        max_trans_step = 0.001  # 平移最大步长 (米)
        max_rot_step = 0.01     # 旋转最大步长 (弧度)
        
        for start_pose, end_pose, motion_type in waypoints:
            # 转换为numpy数组便于计算
            start = np.array(start_pose, dtype=np.float64)
            end = np.array(end_pose, dtype=np.float64)
            
            # 计算平移和旋转距离
            trans_dist = np.linalg.norm(end[:3] - start[:3])  # 平移距离
            rot_dist = np.linalg.norm(end[3:] - start[3:])    # 旋转距离
            
            # 根据距离和最大步长计算所需步数（取较大值确保平滑性）
            trans_steps = builtins.max(1, int(np.ceil(trans_dist / max_trans_step))) if trans_dist > 1e-6 else 1
            rot_steps = builtins.max(1, int(np.ceil(rot_dist / max_rot_step))) if rot_dist > 1e-6 else 1
            steps = builtins.max(trans_steps, rot_steps)
            
            # 计算每步所需时间（根据最大速度限制）
            total_dist = np.hypot(trans_dist, rot_dist)  # 综合距离
            if total_dist < 1e-6:
                continue  # 距离过短，无需移动
            
            next_tick = time.perf_counter()
            print(f"[rm_move_to_target] {motion_type}阶段: 平移{trans_dist:.3f}m, 旋转{rot_dist:.3f}rad, 步数{steps}")
            
            for i in range(1, steps + 1):
                # 计算当前插值位姿（线性插值）
                ratio = i / steps
                current_pose = (1.0 - ratio) * start + ratio * end
                
                # 发送运动指令
                ret = self.robot.rm_movep_canfd(current_pose.tolist(), True)
                
                # 检查运动指令返回值
                if isinstance(ret, int) and ret != 0:
                    print(f"[rm_move_to_target] {motion_type}运动指令失败，返回码: {ret}")
                    return False
                
                # 精确控制时间节拍
                next_tick += self.dt
                sleep_time = next_tick - time.perf_counter()
                if sleep_time > 0:
                    time.sleep(sleep_time)
                # 处理时间漂移
                while next_tick <= time.perf_counter():
                    next_tick += self.dt
        print(f"[rm_move_to_target] 成功到达目标位姿。")
        return True
    #抓取后先直接上移取出U型管，不知道为什么不起作用的废弃方法
    # def rm_move_to_target_above(self, target_pose):
    #     target_above_pose = np.array(target_pose, dtype=np.float64)
    #     target_above_pose[0] = target_above_pose[0] - 0.05
    #     ret = self.robot.rm_movep_canfd(target_above_pose.tolist(), True)
    #     if isinstance(ret, int) and ret != 0:
    #                 print(f"[rm_move_to_target_above] 运动指令失败，返回码: {ret}")
    #                 return False
    #     return True

    def rm_move_to_target_above(self, target_pose) -> bool:
        '''
        抓取后上抬5cm取出U型管，改自rm_move_to_target()方法
        '''
        # 1. 读取当前位姿并验证
        error, state = self.robot.rm_get_current_arm_state()
        if error != 0:
            print(f"[rm_move_to_target] 读取当前位姿失败，错误码: {error}")
            return False
        cur_pose = list(state["pose"])  # [x, y, z, rx, ry, rz]
        
        # 2. 提取并转换坐标（确保使用Python原生float）
        try:
            # 当前位姿 
            cur_x, cur_y, cur_z = map(float, cur_pose[:3]) 
            cur_rx, cur_ry, cur_rz = map(float, cur_pose[3:])

            # 目标位姿 
            tgt_x, tgt_y, tgt_z = map(float, target_pose[:3]) 
            tgt_x = tgt_x - 0.05
            tgt_rx, tgt_ry, tgt_rz = map(float, target_pose[3:])
        except (IndexError, ValueError) as e:
            print(f"[rm_move_to_target] 位姿数据解析失败: {str(e)}")
            return False
        
        # 3. 计算关键高度参数
        safe_X = cur_x - 0.01  # 安全高度（额外加1cm冗余）
        
        # 4. 生成四段式路点
        # 路点1: 竖直上抬到安全高度（保持当前姿态）
        wp1 = [safe_X, cur_y, cur_z, cur_rx, cur_ry, cur_rz]
        # 路点2: 在安全高度平面平移到目标XY位置（保持当前姿态）
        wp2 = [safe_X, tgt_y, tgt_z, cur_rx, cur_ry, cur_rz]
        # 路点3: 在安全高度旋转至目标姿态（保持YZ位置和高度）
        wp3 = [safe_X, tgt_y, tgt_z, tgt_rx, tgt_ry, tgt_rz]
        # 路点4: 下落到目标位置（保持目标姿态）
        wp4 = [tgt_x, tgt_y, tgt_z, tgt_rx, tgt_ry, tgt_rz]

        # 5. 执行基于距离的线性插补运动
        waypoints = [
            (cur_pose, wp1, "上抬"),
            (wp1, wp2, "平移"),
            (wp2, wp3, "旋转"),
            (wp3, wp4, "下落")
        ]
        
        # 设定每步最大移动距离（平移和旋转）
        max_trans_step = 0.001  # 平移最大步长 (米)
        max_rot_step = 0.01     # 旋转最大步长 (弧度)
        
        for start_pose, end_pose, motion_type in waypoints:
            # 转换为numpy数组便于计算
            start = np.array(start_pose, dtype=np.float64)
            end = np.array(end_pose, dtype=np.float64)
            
            # 计算平移和旋转距离
            trans_dist = np.linalg.norm(end[:3] - start[:3])  # 平移距离
            rot_dist = np.linalg.norm(end[3:] - start[3:])    # 旋转距离
            
            # 根据距离和最大步长计算所需步数（取较大值确保平滑性）
            trans_steps = builtins.max(1, int(np.ceil(trans_dist / max_trans_step))) if trans_dist > 1e-6 else 1
            rot_steps = builtins.max(1, int(np.ceil(rot_dist / max_rot_step))) if rot_dist > 1e-6 else 1
            steps = builtins.max(trans_steps, rot_steps)
            
            # 计算每步所需时间（根据最大速度限制）
            total_dist = np.hypot(trans_dist, rot_dist)  # 综合距离
            if total_dist < 1e-6:
                continue  # 距离过短，无需移动
            
            next_tick = time.perf_counter()
            print(f"[rm_move_to_target] {motion_type}阶段: 平移{trans_dist:.3f}m, 旋转{rot_dist:.3f}rad, 步数{steps}")
            
            for i in range(1, steps + 1):
                # 计算当前插值位姿（线性插值）
                ratio = i / steps
                current_pose = (1.0 - ratio) * start + ratio * end
                
                # 发送运动指令
                ret = self.robot.rm_movep_canfd(current_pose.tolist(), True)
                
                # 检查运动指令返回值
                if isinstance(ret, int) and ret != 0:
                    print(f"[rm_move_to_target] {motion_type}运动指令失败，返回码: {ret}")
                    return False
                
                # 精确控制时间节拍
                next_tick += self.dt
                sleep_time = next_tick - time.perf_counter()
                if sleep_time > 0:
                    time.sleep(sleep_time)
                # 处理时间漂移
                while next_tick <= time.perf_counter():
                    next_tick += self.dt
        print(f"[rm_move_to_target] 成功到达目标位姿。")
        return True

    def get_obj(self, fine_pose):
        target_pose = self.Get_right_tool_pose(*fine_pose)
        error = self.rm_move_to_target(target_pose)
        if error is False:
            print("[DexhandGrasping] 移动到目标位姿失败。")
            return False       
        self.robot.ys_gripper.catch()
        self.rm_move_to_target_above(target_pose)
        return True
        
    def execute(self, part_pose):
        """
        同步执行抓取流程:
        - 根据 part_pose 算预抓取位姿
        - 机器人移动
        - 手闭合
        返回: True/False
        """
        self.robot.ys_gripper.normal()
        # self.robot.Move_to_precatch_home()
        self.robot.ys_gripper.pre_catch()
        if part_pose is not None:
            error = self.get_obj(part_pose)
            if error is not True:
                return False
        self.robot.Move_to_assemble_home()
        return True
    
if __name__  == "__main__":
    target_pose = [0.3018,0.26319,0.75248,0.3281,0.03298,-2.9983]
    robot = RM65_6F(robot_ip="192.168.1.19", port=8080, is_use_ys_gripper=True)
    grasp = DexhandGrasping(robot=robot)
    grasp.execute(target_pose)
    robot.disconnect_robot()
    robot.ys_gripper.disconnect()
