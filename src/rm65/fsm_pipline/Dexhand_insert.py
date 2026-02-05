#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""
Dexhand_insert：插管任务中的在完成大致对齐任务后的插入动作
"""
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
from types import SimpleNamespace  # 顶部导入

class DexhandInsert(object):
    def __init__(self, robot, dt=0.01,
                Md_t = np.diag([0.05, 0.05, 0.05]),      # Md_t = np.diag([2.0, 2.0, 1.0]),
                Dd_t = np.diag([0.01, 0.01, 0.01]),   # Dd_t = np.diag([60.0, 60.0, 40.0]),
                Kd_t = np.diag([0.0, 0.0, 0.0]),      # Kd_t = np.diag([0.0, 0.0, 0.0]),
                Md_r = np.diag([0.03, 0.03, 0.03]),   # Md_r = np.diag([0.03, 0.03, 0.03]),
                Dd_r = np.diag([1.0,  1.0,  1.0 ]),   # Dd_r = np.diag([2.0,  2.0,  2.0 ]),
                Kd_r = np.diag([0.0,  0.0,  0.0 ]),): # Kd_r = np.diag([0.0,  0.0,  0.0 ]),):
        self.robot = robot
        self.dt = dt
        # 限幅
        self.vmax_t = np.array([0.2,0.2,0.2])   # m/s
        self.vmax_r = np.array([0.8,0.8,0.8])      # rad/s
        # 导纳参数
        self.gain = SimpleNamespace(
            Md_t=Md_t, Dd_t=Dd_t, Kd_t=Kd_t,
            Md_r=Md_r, Dd_r=Dd_r, Kd_r=Kd_r
        )

    def rm_move_to_above(self, target_pose_base,          # 6维位姿(基座系)
                        hover: float = 0.05,       # 悬停高度(相对目标X，上方)
                        start_safe_X: float = 0.01    # 起始安全高度(相对当前X，上方)
                        ) -> bool:
        """
        规划并执行：当前 -> 上抬到安全高度 -> 平移到目标正上方 -> 旋转至目标姿态 -> 下到目标上方悬停。
        返回 True/False。
        """
        # 1. 读取当前位姿并验证
        error, state = self.robot.rm_get_current_arm_state()
        if error != 0:
            print(f"[rm_move_to_above] 读取当前位姿失败，错误码: {error}")
            return False
        cur_pose = list(state["pose"])  # [x, y, z, rx, ry, rz]
        
        # 2. 提取并转换坐标（确保使用Python原生float）
        try:
            # 当前位姿 
            cur_x, cur_y, cur_z = map(float, cur_pose[:3]) 
            cur_rx, cur_ry, cur_rz = map(float, cur_pose[3:])

            # 目标位姿 
            tgt_x, tgt_y, tgt_z = map(float, target_pose_base[:3]) 
            tgt_rx, tgt_ry, tgt_rz = map(float, target_pose_base[3:])
        except (IndexError, ValueError) as e:
            print(f"[rm_move_to_above] 位姿数据解析失败: {str(e)}")
            return False
        
        # 3. 计算关键高度参数
        approach_x = tgt_x - hover  # 目标上方悬停高度
        safe_X = builtins.min(cur_x, approach_x) - start_safe_X  # 安全高度（额外加1cm冗余）
        
        # 4. 生成四段式路点
        # 路点1: 竖直上抬到安全高度（保持当前姿态）
        wp1 = [safe_X, cur_y, cur_z, cur_rx, cur_ry, cur_rz]
        # 路点2: 在安全高度平面平移到目标XY位置（保持当前姿态）
        wp2 = [safe_X, tgt_y, tgt_z, cur_rx, cur_ry, cur_rz]
        # 路点3: 在安全高度旋转至目标姿态（保持YZ位置和高度）
        wp3 = [safe_X, tgt_y, tgt_z, tgt_rx, tgt_ry, tgt_rz]
        # 路点4: 下落到目标上方悬停位置（保持目标姿态）
        wp4 = [approach_x, tgt_y, tgt_z, tgt_rx, tgt_ry, tgt_rz]

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
            print(f"[rm_move_to_above] {motion_type}阶段: 平移{trans_dist:.3f}m, 旋转{rot_dist:.3f}rad, 步数{steps}")
            
            for i in range(1, steps + 1):
                # 计算当前插值位姿（线性插值）
                ratio = i / steps
                current_pose = (1.0 - ratio) * start + ratio * end
                
                # 发送运动指令
                ret = self.robot.rm_movep_canfd(current_pose.tolist(), True)
                
                # 检查运动指令返回值
                if isinstance(ret, int) and ret != 0:
                    print(f"[rm_move_to_above] {motion_type}运动指令失败，返回码: {ret}")
                    return False
                
                # 精确控制时间节拍
                next_tick += self.dt
                sleep_time = next_tick - time.perf_counter()
                if sleep_time > 0:
                    time.sleep(sleep_time)
                # 处理时间漂移
                while next_tick <= time.perf_counter():
                    next_tick += self.dt
        print(f"[rm_move_to_above] 成功到达目标上方，悬停高度: {hover*1000:.1f}mm，已同步目标姿态")
        return True

    def tool_twist_to_base_and_integrate(self, pose, v_tool, dt):
        """
        输入:
        pose  = [px, py, pz, rx, ry, rz] (BASE, euler ZYX 内旋)
        v_tool = [vx, vy, vz, wx, wy, wz] (TOOL/body twist)
        返回:
        下一拍 BASE 姿态 [px,py,pz, rx, ry, rz]
        """
        pose   = np.asarray(pose, dtype=float)
        v_tool = np.asarray(v_tool, dtype=float)

        p  = pose[:3]
        rx, ry, rz = pose[3], pose[4], pose[5]           # 用 rx,ry,rz

        # R_base_tool
        R = self.pose_R(pose, map_direction="base_from_tool", ortho=True)

        # --- 姿态更新（右乘，体角速度） ---
        w_b = v_tool[3:]
        th  = float(np.linalg.norm(w_b) * dt)
        if th < 1e-12:
            Exp = np.eye(3)
        else:
            k = w_b / (np.linalg.norm(w_b) + 1e-12)
            K = np.array([[0,    -k[2],  k[1]],
                        [k[2],  0,    -k[0]],
                        [-k[1], k[0],  0  ]], dtype=float)
            Exp = np.eye(3) + np.sin(th)*K + (1-np.cos(th))*(K@K)

        R_next = R @ Exp

        # 正交化保证
        U, _, Vt = np.linalg.svd(R_next)
        R_next = U @ Vt
        if np.linalg.det(R_next) < 0:
            U[:, -1] *= -1.0
            R_next = U @ Vt

        # --- 平移更新（注意：没有 p×w 项） ---
        v_b = v_tool[:3]
        p_next = p + (R @ v_b) * float(dt)

        # R_next → 欧拉 ZYX
        r20 = R_next[2, 0]
        if abs(r20) < 1.0 - 1e-10:
            ry_next = np.arctan2(-r20, np.sqrt(R_next[0,0]**2 + R_next[1,0]**2))
            rz_next = np.arctan2(R_next[1,0], R_next[0,0])
            rx_next = np.arctan2(R_next[2,1], R_next[2,2])
        else:
            ry_next = (np.pi/2) if r20 <= -1.0 + 1e-12 else (-np.pi/2)
            rz_next = 0.0
            rx_next = np.arctan2(-R_next[0,1], R_next[1,1])

        return [float(p_next[0]), float(p_next[1]), float(p_next[2]), float(rx_next), float(ry_next), float(rz_next)]

    def pose_R(self, pose, map_direction: str = "base_from_tool", euler_order: str = "auto", ortho: bool = True) -> np.ndarray:
        """
        从位姿解析旋转矩阵（TOOL→BASE）。支持 euler_order: "rxryrz" | "rzryrx" | "auto"
        """
        pose = np.asarray(pose, dtype=float)
        if pose.size < 6:
            raise ValueError("pose length < 6; expected [px,py,pz, r1,r2,r3].")

        def _Rx(a):
            ca, sa = np.cos(a), np.sin(a)
            return np.array([[1,0,0],[0,ca,-sa],[0,sa,ca]], float)

        def _Ry(a):
            ca, sa = np.cos(a), np.sin(a)
            return np.array([[ca,0,sa],[0,1,0],[-sa,0,ca]], float)

        def _Rz(a):
            ca, sa = np.cos(a), np.sin(a)
            return np.array([[ca,-sa,0],[sa,ca,0],[0,0,1]], float)

        def build_R(order, r1, r2, r3):
            if order == "rxryrz":
                rx, ry, rz = r1, r2, r3
            elif order == "rzryrx":
                rz, ry, rx = r1, r2, r3
            else:
                raise ValueError("euler_order must be rxryrz/rzryrx/auto")
            # ZYX 内旋（等价：外旋 X→Y→Z 的逆序）
            return _Rz(rz) @ _Ry(ry) @ _Rx(rx)

        r1, r2, r3 = float(pose[3]), float(pose[4]), float(pose[5])

        # auto: 先按 rxryrz，若不合理（|det-1|大、或行列式<0），再试 rzryrx
        candidates = ["rxryrz", "rzryrx"] if euler_order == "auto" else [euler_order]
        R_bt = None
        for ord_ in candidates:
            R_try = build_R(ord_, r1, r2, r3)
            # 正交化与右手系修正
            U, _, Vt = np.linalg.svd(R_try)
            R_try = U @ Vt
            if np.linalg.det(R_try) < 0:
                U[:, -1] *= -1.0
                R_try = U @ Vt
            if euler_order != "auto" or (abs(np.linalg.det(R_try) - 1.0) < 1e-6):
                R_bt = R_try
                break
        if R_bt is None:
            R_bt = build_R("rxryrz", r1, r2, r3)  # 兜底

        if map_direction == "base_from_tool":
            return R_bt
        elif map_direction == "tool_from_base":
            return R_bt.T
        else:
            raise ValueError("map_direction must be 'base_from_tool' or 'tool_from_base'")

    def pre_insert(self, F_th: float = 5.0,
            max_time: float = 20.0,
            down_axis: str = "X+",          # “向下方向”：X+/X-/Y+/Y-/Z+/Z-（这里是base坐标系下）
            confirm_cycles: int = 3,        # 连续多少周期超阈才确认接触
            F_side_abort: float = 25.0,     # 侧向力保护阈值 N
            Tau_abort: float = 2.0,         # 绕进给轴扭矩保护阈值 N·m
            stroke_limit = 0.5              # 行程兜底保护阈值 m
        ) -> bool:
        """
        预插阶段：沿“down_axis”轴的正方向推进，直到接触或超时。
        坐标约定：基座坐标；位姿保持原姿态，仅沿指定轴推进。
        返回 True=确认接触；False=超时/保护触发/下发报错。
        """
        # —— 轴索引与方向符号映射 ——
        axis_map = {
            "X+": (0, +1.0), "X-": (0, -1.0),
            "Y+": (1, +1.0), "Y-": (1, -1.0),
            "Z+": (2, +1.0), "Z-": (2, -1.0),
        }
        if down_axis not in axis_map:
            raise ValueError(f"down_axis must be one of {list(axis_map.keys())}")
        idx, sgn = axis_map[down_axis]

        rm_real_ft, pose = self.robot.rm_tool_zero_force_data()
        pose_start = pose
        next_pose = pose_start

        # —— 用于侧向力与“绕进给轴”扭矩的通道选择 ——
        # 轴向为 idx，其余两轴的力范数=侧向力；扭矩组件选择对应轴的那一维
        if idx == 0:          # X 轴推进
            side_idx = (1, 2); tau_i = 3
        elif idx == 1:        # Y 轴推进
            side_idx = (0, 2); tau_i = 4
        else:                 # Z 轴推进
            side_idx = (0, 1); tau_i = 5

        # —— 计时与接触确认计数 ——
        hits = 0
        t0 = time.time()
        next_tick = time.perf_counter()     # ★ 初始化定点节拍
        stroke_accum = 0.0   # 新增：行程累计

        while True:
            rm_real_ft, pose = self.robot.rm_tool_zero_force_data()
            if rm_real_ft[0]>F_th:
                hits += 1
                if hits >= confirm_cycles:
                    print(f"[pre_insert] contact confirmed: |F|={rm_real_ft[0]:.2f} > {F_th} N")
                    return True
            else:
                hits = 0
            
            # 计算本步位移（由速度与周期给出），再限幅一次
            step = 0.001
            next_pose[0] += step

            ret = self.robot.rm_movep_canfd(next_pose, True)
            if ret != 0:
                print(f"[pre_insert] move error: ret={ret}")
                return False

            # 行程兜底
            stroke_accum += step
            if stroke_accum >= stroke_limit:
                print(f"[pre_insert] stroke limit reached ({stroke_accum:.3f} m) without contact.")
                return False

            # 精准定时，保证 100 Hz 真周期
            next_tick += self.dt
            delay = next_tick - time.perf_counter()
            if delay > 0:
                time.sleep(delay)
            else:
                # 迟到：只提示一次，然后重置基准到“现在”，避免连续打印和节拍漂移
                print(f"[sched] overrun {(-delay)*1000:.1f} ms")  # 如需可开
                next_tick = time.perf_counter()

    def insert_with_admittance(self,
                        F_des: float,                      # 轴向目标力（与 down_axis 同号）
                        depth: float = 0.1,                # 目标插入深度（沿 TOOL 轴累计）
                        down_axis: str = "X-",
                        F_tol: float = 2.0,                # 轴向力接近目标的容差
                        side_force_ok: float = 6.0,
                        v_axis_stall: float = 0.002,
                        F_hard: float = 80.0,
                        dF_hard: float = 20.0,
                        success_confirm: int = 5,
                        stroke_limit: float = None,
                    ) -> bool:
        """
        固定 F_des 的导纳插入（无外环 PI），力/扭矩使用 TOOL 系。
        位姿增量用“上一拍 BASE 位姿”与“当前 BASE 位姿”的差，沿 TOOL 轴方向（投影的中值方向）累计推进量。

        约定：
        - rm_tool_zero_force_data() 返回 (w_raw, pose)
            * w_raw: 六维扳手，已在 TOOL 系
            * pose : BASE 系下的末端位姿，格式 [px,py,pz, rx,ry,rz], 属性：euler, zyx, intrinsic
        - tool_twist_to_base_and_integrate(pose, v_tool, dt) 能将 TOOL 体速度积分到 BASE 位姿，并返回下发位姿
        - self.gain.Md_t / Dd_t / Md_r / Dd_r 为导纳质量/阻尼矩阵（3x3）
        - self.vmax_t / self.vmax_r / self.dt 为平移/转动最大体速度与控制周期
        - self.robot.rm_movep_canfd(pose, follow=False) 为位置口下发，返回 0 表示成功
        """
        dt = self.dt
        dt2 = dt * dt
        v_axis_max: float = 0.5    # 轴向速度限幅 0.010
        next_tick = time.perf_counter()

        # --- 轴映射（TOOL） ---
        axis_map = {"X+": (0, +1.0), "X-": (0, -1.0),
                    "Y+": (1, +1.0), "Y-": (1, -1.0),
                    "Z+": (2, +1.0), "Z-": (2, -1.0)}
        if down_axis not in axis_map:
            raise ValueError(f"down_axis must be one of {list(axis_map.keys())}")
        idx_ax, sgn_ax = axis_map[down_axis]
        side_idx = tuple(i for i in (0, 1, 2) if i != idx_ax)

        # --- 目标扳手（仅轴向力） ---
        wd = np.zeros(6, float)
        wd[idx_ax] = float(F_des)     # 注意与传感器符号一致

        # --- 位置级导纳状态：两帧位置状态（TOOL 系） ---
        # s_*：等效平移位移状态；a_*：等效小角度状态（rx,ry,rz）
        s_prev = np.zeros(3); s_curr = np.zeros(3)
        a_prev = np.zeros(3); a_curr = np.zeros(3)

        # 导纳矩阵
        Minv = np.linalg.inv(self.gain.Md_t)    # 3x3
        Jinv = np.linalg.inv(self.gain.Md_r)    # 3x3
        Cmat = self.gain.Dd_t
        bmat = self.gain.Dd_r
        Kmat = self.gain.Kd_t
        kmat = self.gain.Kd_r

        # --- 成功/保护判据 ---
        last_absF = 0.0
        success_hits = 0
        if stroke_limit is None:
            stroke_limit = builtins.max(1.5 * abs(depth), 0.01)

        moved_axis = 0.0
        have_hist = False
        R_prev = None; p_prev = None

        # 无进展看门狗
        no_progress_ticks = 0
        last_progress = 0.0

        # 简单力低通（可选）
        w_lp = None
        alpha = 0.25

        while True:
            # 0) 读力与位姿
            w_raw, pose = self.robot.rm_tool_zero_force_data()
            print("w_raw = ",w_raw)
            w = np.asarray(w_raw, float)           # TOOL: [Fx,Fy,Fz,Mx,My,Mz]
            if w_lp is None:
                w_lp = w.copy()
            else:
                w_lp = alpha * w + (1.0 - alpha) * w_lp
            w = w_lp

            pose = np.asarray(pose, float)         # BASE: [x,y,z, rx,ry,rz]

            # 0.1) 统计沿 TOOL 轴的推进量（两帧中值投影）
            R_bt = self.pose_R(pose, "base_from_tool")
            p = pose[:3]
            if not have_hist:
                R_prev, p_prev, have_hist = R_bt.copy(), p.copy(), True
            else:
                dp_base = p - p_prev
                axis_mid = R_prev[:, idx_ax] + R_bt[:, idx_ax]
                nrm = float(np.linalg.norm(axis_mid))
                if nrm > 1e-9:
                    axis_mid /= nrm
                    moved_axis += sgn_ax * float(np.dot(dp_base, axis_mid))
                R_prev, p_prev = R_bt.copy(), p.copy()

            # 1) 位置级导纳更新（你的公式）(Tool坐标系)
            eF = w[:3] - wd[:3]        # eF = wd[:3] - w[:3]
            eM = w[3:]                 # eM = -w[3:]

            s_next = (2.0*s_curr - s_prev
                    + dt2 * (Minv @ (eF - Kmat @ s_curr))
                    - dt  * (Minv @ (Cmat @ (s_curr - s_prev))))

            a_next = (2.0*a_curr - a_prev
                    + dt2 * (Jinv @ (eM - kmat @ a_curr))
                    - dt  * (Jinv @ (bmat @ (a_curr - a_prev))))

            # 2) 把位置更新转换为 body twist
            v_tool = np.zeros(6, float)
            v_tool[:3] = (s_next - s_curr) / dt
            v_tool[3:] = (a_next - a_curr) / dt

            # 2.1) 限速（整体 + 轴向）
            v_tool[:3] = np.clip(v_tool[:3], -self.vmax_t, self.vmax_t)
            v_tool[idx_ax] = np.clip(v_tool[idx_ax], -v_axis_max, v_axis_max)
            v_tool[3:] = np.clip(v_tool[3:], -self.vmax_r, self.vmax_r)

            # 3) twist → BASE 位姿；发送前做单步限幅（位置≤2mm/姿态≤0.03rad）
            next_pose = self.tool_twist_to_base_and_integrate(pose, v_tool, dt)
            dp = np.asarray(next_pose[:3]) - np.asarray(pose[:3])
            dr = np.asarray(next_pose[3:]) - np.asarray(pose[3:])
            scl = builtins.max(1.0, np.linalg.norm(dp)/0.01, np.linalg.norm(dr)/0.01)   # 放宽单步限幅 scl = builtins.max(1.0, np.linalg.norm(dp)/0.002, np.linalg.norm(dr)/0.03)
            if scl > 1.0:
                next_pose = pose.copy()
                next_pose[:3] += dp/scl
                next_pose[3:] += dr/scl
            print("next_pose = ",next_pose)
            ret = self.robot.rm_movep_canfd(next_pose, False)  
            if isinstance(ret, int) and ret != 0:
                print(f"[insert_with_admittance] move error: ret={ret}")
                return False

            # 4) 判据
            depth_done = (moved_axis >= depth)
            F_side = float(np.linalg.norm(w[list(side_idx)]))
            F_ax   = float(w[idx_ax])
            absF   = float(abs(F_ax))
            dAbsF  = absF - last_absF; last_absF = absF
            bottom_hit  = (absF > F_hard) or (dAbsF > dF_hard and abs(v_tool[idx_ax]) < v_axis_stall)
            near_target = (abs(F_des - F_ax) <= F_tol)

            if ((depth_done or near_target) and (F_side < side_force_ok)) or bottom_hit:
                success_hits += 1
                print("success_data=", w_raw)
                if success_hits >= success_confirm:
                    return True
            else:
                success_hits = 0

            # 5) 行程兜底（取绝对值，防反向无限跑）
            if abs(moved_axis) > stroke_limit:
                print(f"[insert_with_admittance] stroke limit {stroke_limit:.3f} m exceeded (moved={moved_axis:.3f}).")
                return False

            # 5.1) 无进展看门狗（1s 内推进 <0.5mm 且力未接近目标）
            progress = abs(moved_axis)
            if progress - last_progress < 0.0005 and abs(F_des - F_ax) > 3.0:
                no_progress_ticks += 1
            else:
                no_progress_ticks = 0
                last_progress = progress
            if no_progress_ticks >= int(1.0/dt):
                print("[insert_with_admittance] no progress watchdog fired.")
                return False

            # 6) 更新位置级历史帧
            s_prev, s_curr = s_curr, s_next
            a_prev, a_curr = a_curr, a_next

            # 7) 定点节拍
            next_tick += dt
            remain = next_tick - time.perf_counter()
            if remain > 0:
                time.sleep(remain)
            else:
                while next_tick <= time.perf_counter():
                    next_tick += dt
    
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

    def get_right_tool_pose(self, H2base, tool2end):
        """
        输入:
            H2base: 深度相机识别到的物体位姿相对于base（x, y, z, rx, ry, rz）, 
            tool2end: 手指末端相对于机械臂末端（x, y, z, rx, ry, rz）
        输出:机械臂末端(不包含灵巧手)相对于base的位姿（x, y, z, rx, ry, rz）
        """
        T_tool2end_coordinates = np.array([*tool2end])
        # T_tool2end的位姿转换为齐次变换矩阵
        position1 = T_tool2end_coordinates[:3]
        orientation1 = R.from_euler('xyz', T_tool2end_coordinates[3:], degrees=False).as_matrix()
        T_tool2end = np.eye(4)
        T_tool2end[:3, :3] = orientation1
        T_tool2end[:3, 3] = position1

        obj_base_coordinates = np.array([*H2base])
        # 物体相对于机械臂基座的位姿转换为齐次变换矩阵
        position2 = obj_base_coordinates[:3]
        orientation2 = R.from_euler('xyz', obj_base_coordinates[3:], degrees=False).as_matrix()

        T_object_to_base_effector = np.eye(4)
        T_object_to_base_effector[:3, :3] = orientation2
        T_object_to_base_effector[:3, 3] = position2

        T_tool_to_base = T_object_to_base_effector.dot(T_tool2end)
        print(T_tool_to_base)
        result = self.decompose_transform(T_tool_to_base)
        target_pose = list(result[0]) + list(result[1:])
        return target_pose

    def execute(self, hole_pose, TF_status):
        #self.robot.Move_to_middle()#保证安全的中间位置
        # self.robot.Move_to_assemble_home()
        target_pose = self.get_right_tool_pose(hole_pose, TF_status)
        ok = self.rm_move_to_above(target_pose, hover=0.05)
        if not ok:
            print("Move to above target failed.")
            return False
            
        # ---- 预插入阶段 ----
        contact = self.pre_insert(F_th=3.0, max_time=20.0, down_axis="X+", confirm_cycles=3, F_side_abort=25.0, Tau_abort=2.0, stroke_limit=0.2)
        if not contact:
            print("pre_insert: no contact or safety abort.")
            return False

        # ---- 插入阶段 ----
        success = self.insert_with_admittance(
            F_des=10.0,          # 轴向目标力（与 down_axis 的方向一致，例：X+ 向下则 F_des>0）
            depth=0.1,            # 目标插入深度（m），以进入函数瞬间为零点（沿 TOOL 轴累计）
            down_axis="X-",       # X+/X-/Y+/Y-/Z+/Z-（TOOL 坐标系）
            F_tol=2.0,            # 轴向力接近目标的容差
            side_force_ok=6.0,    # 成功时侧向力上限（TOOL）
            v_axis_stall=0.002,   # 判“停滞”的轴向速度阈值 (m/s)
            F_hard=1.6,          # 到底 硬阈值：|F_axis| > F_hard
            dF_hard=20.0,         # 到底 快速上升阈值：Δ|F_axis| > dF_hard
            success_confirm=3,    # 连续 N 拍满足成功条件才判成功
            stroke_limit=5,       # 行程上限（m），None→1.5*depth（至少 1 cm）
        )
        print("insert_with_admittance:", "OK" if success else "FAILED")
        if not success:
            return False
        self.robot.ys_gripper.open()
        # assemble_home_pose = [0.190154, 0.184600, 0.496349, 1.571, -0.001, -3.025]
        self.rm_move_to_above(target_pose, start_safe_X=0.05)
        # self.robot.Move_to_after_insert_pose()#退回到硬编码的插入后位姿
        self.robot.Move_to_middle()
        return True
    
# if __name__ == "__main__":
#     rh = RM65_6F(robot_ip="192.168.1.19",
#                 port=8080,
#                 is_use_ys_gripper = True,  
#                 is_use_force_sampler=False)
#     peg = DexhandInsert(rh.robot, dt=0.01)   # 传 rh.robot，不是 rh
#     peg.execute()