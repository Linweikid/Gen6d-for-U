# -*- coding: utf-8 -*-
"""
RH56DFTP_hand（异步改进版）30帧
--------------------------------------------------
基于原实现，将 **取样**（高频 Modbus‑TCP 读取）与 **GUI 绘图** 解耦：
    • 采样线程：目标 120 Hz，把最新帧放入 Queue，并持续写 JSONL 日志。
    • GUI 线程：目标 30 FPS，只渲染最新一帧热力图。 
"""

# ---------- 标准库 & 第三方 ----------
import matplotlib
matplotlib.rcParams['axes.unicode_minus'] = False
import glob
from pymodbus.client.sync import ModbusTcpClient
from pymodbus.pdu import ExceptionResponse
import time, json, datetime, csv
from pathlib import Path
from queue import Queue, Empty          
import threading                        
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.colors as mcolors
from matplotlib.widgets import Slider


class RH56DFTP_hand:
    def __init__(self, ip_address: str = "192.168.1.9", port: int = 6000, is_connect = True):
        self.ip_address = ip_address
        self.port = port
        self.isconnect = is_connect
        # ------------------- 寄存器字典 -------------------
        self.regdict = {
            'ID': 1000, 'baudrate': 1001, 'clearErr': 1004, 'forceClb': 1009,
            'angleSet': 1486, 'forceSet': 1498, 'speedSet': 1522,
            'angleAct': 1546, 'forceAct': 1582, 'Action': 1600,
            'errCode': 1606, 'statusCode': 1612, 'temp': 1618,
            'actionSeq': 2320, 'actionRun': 2322
        }

        # ------------------- 触觉寄存器区段 -------------------
        self.TOUCH_SENSOR_BASE_ADDR_PINKY  = 3000
        self.TOUCH_SENSOR_END_ADDR_PINKY   = 3369
        self.TOUCH_SENSOR_BASE_ADDR_RING   = 3370
        self.TOUCH_SENSOR_END_ADDR_RING    = 3739
        self.TOUCH_SENSOR_BASE_ADDR_MIDDLE = 3740
        self.TOUCH_SENSOR_END_ADDR_MIDDLE  = 4109
        self.TOUCH_SENSOR_BASE_ADDR_INDEX  = 4110
        self.TOUCH_SENSOR_END_ADDR_INDEX   = 4479
        self.TOUCH_SENSOR_BASE_ADDR_THUMB  = 4480
        self.TOUCH_SENSOR_END_ADDR_THUMB   = 4899
        self.TOUCH_SENSOR_BASE_ADDR_PALM   = 4900
        self.TOUCH_SENSOR_END_ADDR_PALM    = 5123

        self.MAX_REGISTERS_PER_READ = 125

        # >>>>>>>>>>>>>>>>>  一次性缓存各区段地址  <<<<<<<<<<<<<<<<<
        self.finger_ranges = {
            "小拇指": (self.TOUCH_SENSOR_BASE_ADDR_PINKY,  self.TOUCH_SENSOR_END_ADDR_PINKY),
            "无名指": (self.TOUCH_SENSOR_BASE_ADDR_RING,   self.TOUCH_SENSOR_END_ADDR_RING),
            "中指"  : (self.TOUCH_SENSOR_BASE_ADDR_MIDDLE, self.TOUCH_SENSOR_END_ADDR_MIDDLE),
            "食指"  : (self.TOUCH_SENSOR_BASE_ADDR_INDEX,  self.TOUCH_SENSOR_END_ADDR_INDEX),
            "大拇指": (self.TOUCH_SENSOR_BASE_ADDR_THUMB,  self.TOUCH_SENSOR_END_ADDR_THUMB),
            "掌心"  : (self.TOUCH_SENSOR_BASE_ADDR_PALM,   self.TOUCH_SENSOR_END_ADDR_PALM),
        }  

        if (self.isconnect):
            # ------------------- Modbus 连接 -------------------
            self.client = self.open_modbus()

            # ------------------- 控制参数 -------------------
            self.write6('speedSet', [1000]*6)
            time.sleep(1)
            self.write6('forceSet', [500]*6)
            time.sleep(1)

        # >>>>>>>>>>>>>>>>>  队列 & 事件  <<<<<<<<<<<<<<<<<
        self.frame_q  = Queue(maxsize=1)     # 只保留最新帧
        self.stop_evt = threading.Event()

    def read_firmware_version(self):
        """
        读取固件版本，返回十六进制字符串 地址14
        """
        response = self.client.read_holding_registers(address=14, count=1)
        if isinstance(response, ExceptionResponse) or response.isError():
            print(f"读取固件版本失败：{response}")
            return None
        else:
            reg_value = response.registers[0]
            # 转换为16进制字符串
            version = format(reg_value, '04X')  # 4位，补零
            return version
        
    # ------------------- 采样线程 -------------------
    def _poll_thread(self, target_hz: int, log_path: Path):
        period = 1.0 / target_hz
        next_t = time.perf_counter()
        with open(log_path, "a", buffering=1, encoding="utf-8") as fp:
            while not self.stop_evt.is_set():
                cache = {}
                log_entry = {"timestamp": datetime.datetime.now().isoformat()}
                for part, (a0, a1) in self.finger_ranges.items():
                    raw = self.read_register_range(a0, a1)
                    log_entry[part] = raw
                    cache[part] = (self.format_palm_data(raw) if part == "掌心"
                                    else self.format_finger_data(part, raw))
                try:
                    self.frame_q.get_nowait()
                except Empty:
                    pass
                self.frame_q.put_nowait(cache)
                fp.write(json.dumps(log_entry, ensure_ascii=False)+"\n")
                next_t += period
                time.sleep(max(0, next_t - time.perf_counter()))

    def open_modbus(self):
        print('Modbus TCP 连接成功!!!')
        # client = ModbusTcpClicent(self.ip_address, self.port)
        # client.connect()
        # return client
        client = ModbusTcpClient(self.ip_address, port=self.port, timeout=1)
        ok = client.connect()
        if not ok:
            raise RuntimeError(f"Modbus connect failed: {self.ip_address}:{self.port}")
        print(f"Modbus TCP 已连接: {self.ip_address}:{self.port}")
        return client

    def write_register(self, address, values):
        # Modbus 写入寄存器，传入寄存器地址和要写入的值列表
        self.client.write_registers(address, values)

    def read_register(self, address, count):
        # Modbus 读取寄存器
        response = self.client.read_holding_registers(address, count)
        return response.registers if response.isError() is False else []

    def write6(self, reg_name, val):
        if reg_name in ['angleSet', 'forceSet', 'speedSet']:
            val_reg = []
            for i in range(6):
                val_reg.append(val[i] & 0xFFFF)  # 取低16位
            self.write_register(self.regdict[reg_name], val_reg)

        else:
            print('函数调用错误，正确方式：str的值为\'angleSet\'/\'forceSet\'/\'speedSet\'，val为长度为6的list，值为0~1000，允许使用-1作为占位符')

    def read6(self, reg_name):
        # 检查寄存器名称是否在允许的范围内
        if reg_name in ['angleSet', 'forceSet', 'speedSet', 'angleAct', 'forceAct','Action']:
            # 直接读取与reg_name对应的寄存器，读取的数量为6
            val = self.read_register(self.regdict[reg_name], 6)
            if len(val) < 6:
                print('没有读到数据')
                return
            # print('读到的值依次为：', end='')
            # for v in val:
            #     print(v, end=' ')
            # print()

            return val
        
        elif reg_name in ['errCode', 'statusCode', 'temp']:
            # 读取错误代码、状态代码或温度，每次读取3个寄存器
            val_act = self.read_register(self.regdict[reg_name], 3)
            if len(val_act) < 3:
                print('没有读到数据')
                return
                
            # 初始化存储高低位的数组
            results = []
            
            # 将每个寄存器的高位和低位分开存储
            for i in range(len(val_act)):
                # 读取当前寄存器和下一个寄存器
                low_byte = val_act[i] & 0xFF            # 低八位
                high_byte = (val_act[i] >> 8) & 0xFF     # 高八位
            
                results.append(low_byte)  # 存储低八位
                results.append(high_byte)  # 存储高八位

            print('读到的值依次为：', end='')
            for v in results:
                print(v, end=' ')
            print()
        
        else:
            print('函数调用错误，正确方式：str的值为\'angleSet\'/\'forceSet\'/\'speedSet\'/\'angleAct\'/\'forceAct\'/\'errCode\'/\'statusCode\'/\'temp\'')

    def read6_sampling(self, reg_name, split_bytes: bool = True, pad_to = 6):
        """
        静默稳定读取：
        - 'angleSet'/'forceSet'/'speedSet'/'angleAct'/'forceAct'/'Action' → 6寄存器
        - 'errCode'/'statusCode'/'temp' → 3寄存器；split_bytes=True 时拆成 6 个字节
        - pad_to: 长度不足用 None 右侧补齐；为 None 则不补
        """
        try:
            if reg_name in ['angleSet','forceSet','speedSet','angleAct','forceAct','Action']:
                vals = self.read_register(self.regdict[reg_name], 6) or []
                out = list(vals[:6])
            elif reg_name in ['errCode','statusCode','temp']:
                vals3 = self.read_register(self.regdict[reg_name], 3) or []
                if split_bytes:
                    out = []
                    for v in vals3[:3]:
                        out.append(v & 0xFF)          # 低8位
                        out.append((v >> 8) & 0xFF)   # 高8位
                else:
                    out = list(vals3[:3])
            else:
                out = []
        except Exception:
            out = []
        if pad_to is not None and len(out) < pad_to:
            out = out + [None] * (pad_to - len(out))
        return out

    def read_register_range(self, start_addr, end_addr):
        """
        批量读取指定地址范围内的寄存器数据。
        """
        register_values = []  
        # 分段读取寄存器
        for addr in range(start_addr, end_addr + 1, self.MAX_REGISTERS_PER_READ * 2):

            current_count = min(self.MAX_REGISTERS_PER_READ, (end_addr - addr) // 2 + 1)


            response = self.client.read_holding_registers(address=addr, count=current_count)

            if isinstance(response, ExceptionResponse) or response.isError():
                print(f"读取寄存器 {addr} 失败: {response}")
                register_values.extend([0] * current_count)  
            else:
                register_values.extend(response.registers) 

        return register_values

    def format_finger_data(self, finger_name, data):
        """
        格式化四指触觉数据。
        """
        result = {}
        if finger_name == "大拇指":
            # 大拇指格式
            if len(data) < 210:
                print(f"{finger_name} 数据长度不足，至少210个数据，实际：{len(data)}")
                return None
            idx = 0
            # 指端数据 3x3
            tip_end = [data[idx + i*3: idx + (i+1)*3] for i in range(3)]
            idx += 9
            # 仅做矩阵转置 (3×3 → 3×3)
            tip_end = [list(col) for col in zip(*tip_end)]
            result['tip_end'] = tip_end

            # 指尖触觉数据 12x8
            result['tip_touch'] = [data[idx + i*8: idx + (i+1)*8] for i in range(12)]
            idx += 96

            # 指中触觉数据 3x3
            middle_touch = [data[idx + i*3: idx + (i+1)*3] for i in range(3)]
            idx += 9
            # 仅做矩阵转置 (3×3 → 3×3)
            middle_touch = [list(col) for col in zip(*middle_touch)]
            result['middle_touch'] = middle_touch

            # 指腹触觉数据 12x8
            finger_pad = [data[idx + i*8: idx + (i+1)*8] for i in range(12)]
            idx += 96
            # 指腹触觉数据行元素反转
            finger_pad = [row[::-1] for row in finger_pad]
            # 指腹触觉数据行顺序反转
            finger_pad.reverse()
            result['finger_pad'] = finger_pad
        else:
            # 四指格式
            if len(data) < 185:
                print(f"{finger_name} 数据长度不足，至少185个数据，实际：{len(data)}")
                return None
            idx = 0
            # 指端数据 3x3
            tip_end = [data[idx + i*3: idx + (i+1)*3] for i in range(3)]
            idx += 9
            # 仅做矩阵转置 (3×3 → 3×3)
            tip_end = [list(col) for col in zip(*tip_end)]
            result['tip_end'] = tip_end

            # 指尖触觉数据 12x8
            result['tip_touch'] = [data[idx + i*8: idx + (i+1)*8] for i in range(12)]
            idx += 96

            # 指腹触觉数据 10x8
            result['finger_pad'] = [data[idx + i*8: idx + (i+1)*8] for i in range(10)]
            idx += 80

        return result

    def format_palm_data(self, data):
        """
        格式化掌心数据为14x8矩阵，然后转置为8x14矩阵。
        """
        expected_len = 14 * 8
        if len(data) < expected_len:
            print(f"掌心数据长度不足，至少{expected_len}个数据，实际：{len(data)}")
            return None

        # 生成原始矩阵（14行8列）
        palm_matrix = [data[i*8:(i+1)*8] for i in range(14)]
        # 转置矩阵
        transposed = list(map(list, zip(*palm_matrix)))

        return transposed

    def read_multiple_registers(self):
        try:
            while True:  
                start_time = time.time()  

                # 读取各部分数据
                pinky_register_values = self.read_register_range(
                    self.TOUCH_SENSOR_BASE_ADDR_PINKY,
                    self.TOUCH_SENSOR_END_ADDR_PINKY
                )

                ring_register_values = self.read_register_range(
                    self.TOUCH_SENSOR_BASE_ADDR_RING,
                    self.TOUCH_SENSOR_END_ADDR_RING
                )

                middle_register_values = self.read_register_range(
                    self.TOUCH_SENSOR_BASE_ADDR_MIDDLE,
                    self.TOUCH_SENSOR_END_ADDR_MIDDLE
                )

                index_register_values = self.read_register_range(
                    self.TOUCH_SENSOR_BASE_ADDR_INDEX,
                    self.TOUCH_SENSOR_END_ADDR_INDEX
                )

                thumb_register_values = self.read_register_range(
                    self.TOUCH_SENSOR_BASE_ADDR_THUMB,
                    self.TOUCH_SENSOR_END_ADDR_THUMB
                )

                palm_register_values = self.read_register_range(
                    self.TOUCH_SENSOR_BASE_ADDR_PALM,
                    self.TOUCH_SENSOR_END_ADDR_PALM
                )

                end_time = time.time()
                frequency = 1 / (end_time - start_time) if end_time > start_time else float('inf') 

                # 格式化数据
                pinky_formatted = self.format_finger_data("小拇指", pinky_register_values)
                ring_formatted = self.format_finger_data("无名指", ring_register_values)
                middle_formatted = self.format_finger_data("中指", middle_register_values)
                index_formatted = self.format_finger_data("食指", index_register_values)
                thumb_formatted = self.format_finger_data("大拇指", thumb_register_values)
                palm_formatted = self.format_palm_data(palm_register_values)

                # 打印数据
                print(f"小拇指数据：{pinky_formatted}")
                print(f"无名指数据：{ring_formatted}")
                print(f"中指数据：{middle_formatted}")
                print(f"食指数据：{index_formatted}")
                print(f"大拇指数据：{thumb_formatted}")
                print(f"掌心数据：{palm_formatted}")
                print(f"读取频率：{frequency:.2f} Hz")  
        finally:
            self.disconnect()

    def disconnect(self):
        print('关闭Modbus TCP连接！')
        self.client.close()

    def conrtol_hand(self, target_ang):
        self.write6('angleSet', target_ang)
        # print("target_ang = ",target_ang)
        # val = self.read6('angleAct')
        # print("angleAct = ",val)
        time.sleep(1)
        
        # val = self.read6('angleAct')
        # print(val)
        # error_sum = 0
        # error_sum = sum(abs(v - t) for v, t in zip(val, target_ang) if t != -1)
        # print("误差绝对值之和:", error_sum)
        # # while error_sum > 50:
        # while error_sum > 30:
        #     error_sum = 0
        #     self.write6('angleSet', target_ang)
        #     time.sleep(1)
        #     val = self.read6('angleAct')
        #     error_sum = sum(abs(v - t) for v, t in zip(val, target_ang) if t != -1)
        #     print("误差绝对值之和:", error_sum)

    def catch(self):
        """
        self.conrtol_hand([-1, -1, -1, 610, -1, -1])
        self.conrtol_hand([0, 0, 0, 500, 500, 0])
        """
        self.conrtol_hand([0, 0, 0, 500, 400, 0])

    def normal(self):
        target_ang = [1000, 1000, 1000, 1000, 500, 1000]
        self.conrtol_hand(target_ang)

    def pre_catch(self):
        # target_ang = [0, 0, 0, 1000, 550, 0]
        # target_ang = [0, 0, 0, 1000, 500, 0]
        target_ang = [0, 0, 0, 1000, 400, 0]
        self.conrtol_hand(target_ang)

    def open(self):
        self.conrtol_hand([0, 0, 0, 550, 550, 0])

    # ------------------- 主函数：采样 + GUI -------------------
    def read_multiple_registers_map(self, duration_sec=0, target_hz=120,
                                gui_fps=30, save_png_every=0):
        # ---------- 路径 ----------
        run_id = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
        log_dir = Path("logs"); log_dir.mkdir(exist_ok=True)
        heatmap_dir = Path("heatmaps"); heatmap_dir.mkdir(exist_ok=True)
        tactile_log_path = log_dir / f"tactile_{run_id}.jsonl"
        joints_csv_path  = log_dir / f"joints_{run_id}.csv"
        
        csv_headers = (
            ["timestamp"] +
            [f"angleSet{i+1}" for i in range(6)] +
            [f"forceSet{i+1}" for i in range(6)] +
            [f"speedSet{i+1}" for i in range(6)] +
            [f"angleAct{i+1}" for i in range(6)] +
            [f"forceAct{i+1}" for i in range(6)] +
            [f"Action{i+1}"   for i in range(6)] +
            [f"err{i}"    for i in range(6)] +
            [f"status{i}" for i in range(6)] +
            [f"temp{i}"   for i in range(6)]
        )

        # ---------- 区域与布局（原样） ----------
        region_dict = {
            "pinky_tip":  ("小拇指","tip_end",    (3,3)),
            "pinky_pad":  ("小拇指","tip_touch", (12,8)),
            "pinky_base": ("小拇指","finger_pad",(10,8)),
            "ring_tip":   ("无名指","tip_end",    (3,3)),
            "ring_pad":   ("无名指","tip_touch", (12,8)),
            "ring_base":  ("无名指","finger_pad",(10,8)),
            "middle_tip": ("中指",  "tip_end",    (3,3)),
            "middle_pad": ("中指",  "tip_touch", (12,8)),
            "middle_base":("中指",  "finger_pad",(10,8)),
            "index_tip":  ("食指",  "tip_end",    (3,3)),
            "index_pad":  ("食指",  "tip_touch", (12,8)),
            "index_base": ("食指",  "finger_pad",(10,8)),
            "thumb_tip":  ("大拇指","tip_end",      (3,3)),
            "thumb_pad":  ("大拇指","tip_touch",    (12,8)),
            "thumb_extra":("大拇指","middle_touch", (3,3)),
            "thumb_base": ("大拇指","finger_pad",   (12,8)),
            "palm":       ("掌心",  None,            (8,14)),
        }
        layout_rows = [
            ["pinky_tip","ring_tip","middle_tip","index_tip","thumb_tip"],
            ["pinky_pad","ring_pad","middle_pad","index_pad","thumb_pad"],
            ["pinky_base","ring_base","middle_base","index_base","thumb_extra"],
            ["palm",None,None,None,"thumb_base"],
        ]

        # ---------- 画布 ----------
        gap_x=1; gap_y=1; right_pad=0.10; label_pad=0.02; cell_inch=0.35
        num_cols=len(layout_rows[0])
        col_widths=[max(region_dict[n][2][1] if n else 0 for n in col) for col in zip(*layout_rows)]
        row_heights=[max(region_dict[n][2][0] if n else 0 for n in row) for row in layout_rows]
        W_raw=sum(col_widths)+gap_x*(num_cols-1)
        H_raw=sum(row_heights)+gap_y*(len(row_heights)-1)
        col_left=np.cumsum([0]+[w+gap_x for w in col_widths[:-1]])
        usable=1-right_pad

        norm = mcolors.Normalize(vmin=0, vmax=4096)
        cmap = plt.get_cmap("hot")

        global fig
        fig=plt.figure(figsize=((1+right_pad)*W_raw*cell_inch, H_raw*cell_inch))
        try: fig.canvas.manager.set_window_title(f"Tactile Heatmaps · {run_id}")
        except: pass
        img_handlers={}; region_order=[]
        y_cursor=H_raw
        for r,row in enumerate(layout_rows):
            y_cursor-=row_heights[r]
            for c,name in enumerate(row):
                if name is None: continue
                part,sub_key,(h,w)=region_dict[name]
                left_raw=(W_raw-w)//2 if name=="palm" else col_left[c]+(col_widths[c]-w)//2
                ax=fig.add_axes([left_raw/W_raw*usable, y_cursor/H_raw, w/W_raw*usable, h/H_raw])
                im=ax.imshow(np.zeros((h,w)), cmap=cmap, norm=norm, origin="upper")
                ax.axis("off"); ax.set_aspect("equal")
                ax.text(1+label_pad,0.5,name.replace("_"," "),transform=ax.transAxes,
                        va="center",ha="left",fontsize=8,clip_on=False)
                img_handlers[name]=im; region_order.append(name)
            y_cursor-=gap_y
        cax=fig.add_axes([usable+0.02,0.1,0.02,0.8]); fig.colorbar(im,cax=cax)
        plt.ion(); plt.show(block=False)

        # ---------- 线程与互斥 ----------
        if not hasattr(self, "io_lock"):
            self.io_lock = threading.Lock()

        # 启动触觉采样线程（保持原样，不改触觉JSONL格式）
        poll = threading.Thread(target=self._poll_thread, args=(target_hz, tactile_log_path), daemon=True)
        poll.start()

        # CSV 同步线程：逐行 tail 触觉 JSONL；每来一行 → 读一次 joint（块读）→ 写一行 CSV（同一 timestamp）
        csv_stop = threading.Event()

        # 块读 + 解析九组（1486~1620）
        def _read_joints_block_once():
            start, end = 1486, 1620
            vals = []
            for addr in range(start, end+1, self.MAX_REGISTERS_PER_READ):
                cnt = min(self.MAX_REGISTERS_PER_READ, end - addr + 1)
                with self.io_lock:
                    resp = self.client.read_holding_registers(address=addr, count=cnt)
                if isinstance(resp, ExceptionResponse) or resp.isError() or not getattr(resp, "registers", None):
                    return None
                vals.extend(resp.registers)
            if len(vals) < (end-start+1):
                return None

            def _slice(base, n):
                i = base - start
                return vals[i:i+n]
            def _split3_to6(v3):
                out=[]
                for v in v3[:3]:
                    out.append(v & 0xFF)
                    out.append((v >> 8) & 0xFF)
                while len(out) < 6: out.append(None)
                return out[:6]

            angleSet = _slice(1486, 6)
            forceSet = _slice(1498, 6)
            speedSet = _slice(1522, 6)
            angleAct = _slice(1546, 6)
            forceAct = _slice(1582, 6)
            Action   = _slice(1600, 6)
            err_cd   = _split3_to6(_slice(1606, 3))
            status   = _split3_to6(_slice(1612, 3))
            temp     = _split3_to6(_slice(1618, 3))
            return [angleSet, forceSet, speedSet, angleAct, forceAct, Action, err_cd, status, temp]

        def _csv_sync_worker():
                    # 打开 CSV
                    need_header = (not joints_csv_path.exists()) or (joints_csv_path.stat().st_size == 0)
                    with open(joints_csv_path, "a", newline="", encoding="utf-8") as fp_csv:
                        writer = csv.writer(fp_csv)
                        if need_header: writer.writerow(csv_headers); fp_csv.flush()

                        # 以“从文件开头”开始 tail（确保本次运行的触觉帧全部会被消费）
                        with open(tactile_log_path, "r", encoding="utf-8") as fp_jsonl:
                            # 不跳到末尾：从头读，逐行阻塞等待新帧
                            while not csv_stop.is_set():
                                pos = fp_jsonl.tell()
                                line = fp_jsonl.readline()
                                if not line:
                                    time.sleep(0.005)  # 等待新行
                                    fp_jsonl.seek(pos)
                                    continue
                                s = line.strip()
                                if not s:
                                    continue
                                try:
                                    obj = json.loads(s)
                                except Exception:
                                    continue
                                ts = obj.get("timestamp")
                                if not isinstance(ts, str) or not ts:
                                    continue

                                # 读 joint（失败短重试）
                                joints = None
                                for _ in range(3):
                                    joints = _read_joints_block_once()
                                    if joints is not None:
                                        break
                                    time.sleep(0.002)

                                if joints is None:
                                    row = [ts] + [None]* (6*6 + 6 + 6 + 6)  # 6组x6 + err6 + status6 + temp6
                                else:
                                    (angleSet, forceSet, speedSet, angleAct, forceAct, Action, err_cd, status, temp) = joints
                                    row = [ts] + angleSet + forceSet + speedSet + angleAct + forceAct + Action + err_cd + status + temp

                                writer.writerow(row)
                                fp_csv.flush()  # 一帧一 flush，保证你随时看到行数增长

        csv_thread = threading.Thread(target=_csv_sync_worker, daemon=True)
        csv_thread.start()

                # ---------- GUI 主循环：只负责绘图，不再写 CSV ----------
        t0 = time.perf_counter()
        draw_intv = 1.0 / max(1, int(gui_fps))
        last_draw = 0.0
        next_png = time.time() + save_png_every if save_png_every > 0 else float("inf")
        try:
            while duration_sec <= 0 or time.perf_counter() - t0 < duration_sec:
                try:
                    cache = self.frame_q.get(timeout=0.2)
                except Empty:
                    continue

                now = time.perf_counter()
                if now - last_draw >= draw_intv:
                    for region_name in region_order:
                        part, sub_key, _ = region_dict[region_name]
                        mat = cache[part] if part == "掌心" else cache[part][sub_key]
                        img_handlers[region_name].set_data(mat)
                    fig.canvas.draw_idle(); fig.canvas.flush_events()
                    last_draw = now

                if save_png_every > 0 and time.time() >= next_png:
                    fig.savefig(heatmap_dir / f"touchmap_{int(time.time())}.png", dpi=100)
                    next_png += save_png_every
        finally:
            csv_stop.set(); csv_thread.join(timeout=1.0)
            self.stop_evt.set(); poll.join(timeout=1.0)
            self.disconnect(); plt.ioff(); plt.close(fig)

    def replay_log(self,
                log_path: str,
                fps: float = 8.0,
                speed: float = 1.0,
                loop: bool = False):
        """
        回放 tactile_*.jsonl（带滑块 / 暂停 / 倍速 / 循环）
        - 自动兼容两类日志格式（旧：中文手指+原始数组；新：区域名+扁平数组）
        - 空格键暂停/继续；speed>1.0 快进，<1.0 慢放
        """

        # —— 区域定义（只需形状即可） ——
        region_shape = {
            "pinky_tip":   (3, 3),  "pinky_pad":   (12, 8), "pinky_base":  (10, 8),
            "ring_tip":    (3, 3),  "ring_pad":    (12, 8), "ring_base":   (10, 8),
            "middle_tip":  (3, 3),  "middle_pad":  (12, 8), "middle_base": (10, 8),
            "index_tip":   (3, 3),  "index_pad":   (12, 8), "index_base":  (10, 8),
            "thumb_tip":   (3, 3),  "thumb_pad":   (12, 8), "thumb_extra": (3, 3),
            "thumb_base":  (12, 8),
            "palm":        (8, 14),
        }

        layout_rows = [
            ["pinky_tip",  "ring_tip",  "middle_tip",  "index_tip",  "thumb_tip"],
            ["pinky_pad",  "ring_pad",  "middle_pad",  "index_pad",  "thumb_pad"],
            ["pinky_base", "ring_base", "middle_base", "index_base", "thumb_extra"],
            ["palm",        None,        None,          None,        "thumb_base"],
        ]

        # —— 读文件 ——
        with open(log_path, "r", encoding="utf-8") as f:
            frames = [json.loads(l) for l in f if l.strip()]
        if not frames:
            print("空日志"); return

        # —— 把一帧 entry 解析为 {区域名: 2D矩阵}，自动适配新旧两种结构 ——
        def entry_to_region_mats(entry: dict) -> dict:
            mats = {}

            # 判定是否为“新格式”（区域键存在）
            has_region_keys = any(k in entry for k in ("palm","pinky_tip","thumb_base"))
            if has_region_keys:
                # 新格式：区域名 -> 扁平/二维数组
                for name, shape in region_shape.items():
                    arr = entry.get(name)
                    if arr is None:
                        continue
                    a = np.asarray(arr)
                    if a.ndim == 1 and a.size == shape[0]*shape[1]:
                        a = a.reshape(shape)
                    elif a.ndim == 2 and a.shape == shape:
                        pass
                    else:
                        # 再尝试强制 reshape（若失败则跳过）
                        try:
                            a = a.reshape(shape)
                        except Exception:
                            continue
                    mats[name] = a
            else:
                # 旧格式：中文手指 -> 原始寄存器数组；需用已有的格式化函数切成区域矩阵
                # 掌心
                palm_raw = entry.get("掌心")
                if palm_raw:
                    palm_mat = self.format_palm_data(palm_raw)
                    if palm_mat is not None:
                        mats["palm"] = np.asarray(palm_mat)

                # 四指 + 拇指
                mapping = [("小拇指","pinky"), ("无名指","ring"),
                        ("中指","middle"), ("食指","index"), ("大拇指","thumb")]
                for cn, prefix in mapping:
                    raw = entry.get(cn)
                    if not raw:
                        continue
                    f = self.format_finger_data(cn, raw)
                    if f is None:
                        continue
                    if prefix != "thumb":
                        mats[f"{prefix}_tip"]  = np.asarray(f["tip_end"])
                        mats[f"{prefix}_pad"]  = np.asarray(f["tip_touch"])
                        mats[f"{prefix}_base"] = np.asarray(f["finger_pad"])
                    else:
                        mats["thumb_tip"]   = np.asarray(f["tip_end"])
                        mats["thumb_pad"]   = np.asarray(f["tip_touch"])
                        mats["thumb_extra"] = np.asarray(f["middle_touch"])
                        mats["thumb_base"]  = np.asarray(f["finger_pad"])

            return mats

        # —— 画布搭建（与实时版保持一致） ——
        gap_x, gap_y = 1, 1
        right_pad, label_pad, cell_inch = 0.10, 0.02, 0.35

        num_cols = len(layout_rows[0])
        col_widths  = [max((region_shape[n][1] if n else 0) for n in col) for col in zip(*layout_rows)]
        row_heights = [max((region_shape[n][0] if n else 0) for n in row) for row in layout_rows]
        W_raw = sum(col_widths) + gap_x*(num_cols-1)
        H_raw = sum(row_heights) + gap_y*(len(row_heights)-1)
        col_left = np.cumsum([0]+[w+gap_x for w in col_widths[:-1]])
        usable = 1 - right_pad

        fig = plt.figure(figsize=((1+right_pad)*W_raw*cell_inch, H_raw*cell_inch))
        norm = mcolors.Normalize(vmin=0, vmax=4096)   # 固定范围，非自适应
        cmap = plt.get_cmap("hot")                    # 如需“白底最大黑”，可换成 plt.get_cmap("gray_r")

        img_handlers = {}
        y_cursor = H_raw
        for r,row in enumerate(layout_rows):
            y_cursor -= row_heights[r]
            for c,name in enumerate(row):
                if name is None: 
                    continue
                h,w = region_shape[name]
                left_raw = (W_raw - w)//2 if name=="palm" \
                        else col_left[c] + (col_widths[c]-w)//2
                ax = fig.add_axes([left_raw/W_raw*usable,
                                y_cursor/H_raw,
                                w/W_raw*usable, h/H_raw])
                im = ax.imshow(np.zeros((h,w)), cmap=cmap, norm=norm,
                            origin="upper", interpolation="nearest")
                ax.axis("off"); ax.set_aspect("equal")
                ax.text(1+label_pad, .5, name.replace("_"," "),
                        transform=ax.transAxes, va="center", ha="left",
                        fontsize=8, clip_on=False)
                img_handlers[name] = im
            y_cursor -= gap_y

        cax = fig.add_axes([usable+0.02, 0.15, 0.02, 0.7])
        fig.colorbar(im, cax=cax)
        ts_text = fig.text(usable+0.02, 0.88, "", fontsize=9)

        # —— 滑块 / 事件 ——
        from matplotlib.widgets import Slider
        ax_slider = fig.add_axes([0.1, 0.02, 0.6, 0.03])
        slider = Slider(ax_slider, "frame", 0, len(frames)-1, valinit=0, valstep=1)
        paused = [False]

        def draw_frame(idx: int):
            entry = frames[idx]
            mats = entry_to_region_mats(entry)

            for name, im in img_handlers.items():
                mat = mats.get(name)
                if mat is None:
                    continue
                # 兜底：若尺寸不符，尝试 reshape
                h,w = region_shape[name]
                if mat.shape != (h,w):
                    try:
                        mat = np.asarray(mat).reshape(h,w)
                    except Exception:
                        continue
                im.set_data(mat)

            ts = entry.get("timestamp","")
            ts_text.set_text(ts)
            try:
                fig.canvas.manager.set_window_title(f"Tactile Replay  •  {ts}")
            except Exception:
                pass
            fig.canvas.draw_idle()

        def on_slider(val):
            draw_frame(int(val))
        slider.on_changed(on_slider)

        def on_key(event):
            if event.key == " ":
                paused[0] = not paused[0]
        fig.canvas.mpl_connect("key_press_event", on_key)

        # —— 主回放循环 ——
        idx = 0
        try:
            while True:
                if not paused[0]:
                    draw_frame(idx)
                    slider.set_val(idx)
                    idx += 1
                    if idx >= len(frames):
                        if loop:
                            idx = 0
                        else:
                            break
                    plt.pause(max(1e-3, 1.0 / (fps * speed if speed > 0 else fps)))
                else:
                    plt.pause(0.05)
        except KeyboardInterrupt:
            pass
        print("回放结束")

    def plot_joints(self,
                csv_path: str,
                show=("angleAct", "forceAct"),   # 可选: angleAct/angleSet/forceAct/forceSet
                fingers=(1, 2, 3, 4, 5, 6),
                downsample: int = 1,
                smooth: int = 1,
                angle_full_scale: float = 1000.0,
                force_full_scale: float = 65535.0,
                lock_ylim: bool = True,          # True=按满量程锁定Y轴，False=自动缩放
                tlim=None):                      # 例: ("2025-10-11 23:21:27", "2025-10-11 23:22:00")
        """
        读取 joints CSV，按实际量程绘制角度/力曲线（X轴=时间戳；65535视为有效满量程）。
        - lock_ylim=True 时：Angle轴固定 [0, angle_full_scale]，Force轴固定 [0, force_full_scale]
        （这样 65535 会正确显示在顶部）
        - lock_ylim=False 时：根据可见数据自动缩放（常数曲线会自动加少量 padding）
        """
        # import csv, glob, datetime
        # import numpy as np
        # import matplotlib
        # matplotlib.rcParams['axes.unicode_minus'] = False
        # import matplotlib.pyplot as plt
        import matplotlib.dates as mdates

        # ---------- 收集文件 ----------
        files = sorted(glob.glob(csv_path))
        if not files:
            print(f"[plot] 未找到 CSV：{csv_path}")
            return

        # ---------- 读取 & 解析 ----------
        rows = []
        header = None
        for f in files:
            with open(f, "r", encoding="utf-8") as fp:
                reader = csv.reader(fp)
                h = next(reader, None)
                if not h:
                    continue
                if header is None:
                    header = h
                idx = {name: i for i, name in enumerate(h)}
                ts_col = idx.get("timestamp")
                if ts_col is None:
                    print(f"[plot] 缺少 timestamp 列：{f}，跳过")
                    continue
                for line in reader:
                    if not line:
                        continue
                    ts = line[ts_col]
                    if not ts:
                        continue
                    ts2 = ts.replace("T", " ")
                    dt = None
                    for fmt in ("%Y-%m-%d %H:%M:%S.%f", "%Y-%m-%d %H:%M:%S"):
                        try:
                            dt = datetime.datetime.strptime(ts2, fmt)
                            break
                        except Exception:
                            pass
                    if dt is None:
                        continue
                    rows.append((dt, line))

        if not rows:
            print("[plot] CSV 内容为空")
            return

        rows.sort(key=lambda x: x[0])
        if isinstance(downsample, int) and downsample > 1:
            rows = rows[::downsample]

        t_dt = np.array([r[0] for r in rows], dtype=object)
        idxmap = {name: i for i, name in enumerate(header or [])}

        def _get(line, key):
            j = idxmap.get(key, -1)
            if j < 0 or j >= len(line):
                return np.nan
            try:
                return float(line[j])
            except Exception:
                return np.nan

        # ---------- 规范 show & fingers ----------
        valid = {"angleAct", "angleSet", "forceAct", "forceSet"}
        show = [s for s in show if s in valid] or ["angleAct", "forceAct"]
        fingers = [fi for fi in fingers if 1 <= fi <= 6] or [1, 2, 3, 4, 5, 6]

        # ---------- 提取数据（各序列 Nx6） ----------
        data = {}
        for s in show:
            arr = np.full((len(rows), 6), np.nan, dtype=float)
            for n, (_, line) in enumerate(rows):
                for k in range(6):
                    arr[n, k] = _get(line, f"{s}{k+1}")
            data[s] = arr

        # ---------- 平滑（简单滑动平均） ----------
        def movavg(a, w):
            if not isinstance(w, int) or w <= 1:
                return a
            out = np.empty_like(a)
            for k in range(a.shape[1]):
                x = a[:, k]
                m = np.isfinite(x)
                if not m.any():
                    out[:, k] = x
                    continue
                xv = x[m]
                cs = np.cumsum(np.insert(xv, 0, 0.0))
                vv = (cs[w:] - cs[:-w]) / w
                head = np.array([xv[:i].mean() for i in range(1, min(w, len(xv)) + 1)])
                y = x.copy()
                y[m] = np.concatenate([head, vv])[:len(xv)]
                out[:, k] = y
            return out

        if isinstance(smooth, int) and smooth > 1:
            for s in list(data.keys()):
                data[s] = movavg(data[s], int(smooth))

        # ---------- 画布 ----------
        want_angle = [s for s in show if s.startswith("angle")]
        want_force = [s for s in show if s.startswith("force")]
        nrows = (1 if want_angle else 0) + (1 if want_force else 0)
        if nrows == 0:
            print("[plot] 没有可画的序列")
            return

        if nrows == 2:
            fig, (ax_ang, ax_for) = plt.subplots(2, 1, figsize=(12, 7), sharex=True)
            axes = []
            if want_angle: axes.append(("Angle", ax_ang, want_angle))
            if want_force: axes.append(("Force", ax_for, want_force))
            ax_for.set_xlabel("Time")
        else:
            fig, ax = plt.subplots(1, 1, figsize=(12, 4))
            axes = []
            if want_angle:
                axes.append(("Angle", ax, want_angle))
            else:
                axes.append(("Force", ax, want_force))
            ax.set_xlabel("Time")

        try:
            fig.canvas.manager.set_window_title("Joints Curves (Timestamp, Full-Scale)")
        except Exception:
            pass

        locator = mdates.AutoDateLocator(minticks=4, maxticks=10)
        formatter = mdates.AutoDateFormatter(locator)

        # ---------- 绘制 ----------
        for title, ax, series_list in axes:
            ax.set_ylabel(title)
            ax.grid(True, alpha=0.3)
            ax.xaxis.set_major_locator(locator)
            ax.xaxis.set_major_formatter(formatter)

            for s in series_list:
                arr = data[s]
                ls = "-" if s.endswith("Act") else "--"  # act 实线, set 虚线
                for fi in fingers:
                    ax.plot(t_dt, arr[:, fi-1], ls=ls, lw=1.0, label=f"{s}{fi}")

            # 时间窗口
            if tlim and isinstance(tlim, (tuple, list)) and len(tlim) == 2:
                def _to_dt(x):
                    if hasattr(x, "year"):
                        return x
                    x = str(x).replace("T", " ")
                    for fmt in ("%Y-%m-%d %H:%M:%S.%f", "%Y-%m-%d %H:%M:%S", "%Y-%m-%d"):
                        try:
                            return datetime.datetime.strptime(x, fmt)
                        except Exception:
                            pass
                    return None
                dt_min = _to_dt(tlim[0]); dt_max = _to_dt(tlim[1])
                if dt_min and dt_max and dt_max > dt_min:
                    ax.set_xlim(dt_min, dt_max)

            # 纵轴范围
            if lock_ylim:
                if title == "Angle":
                    ax.set_ylim(0.0, float(angle_full_scale))
                else:
                    ax.set_ylim(0.0, float(force_full_scale))
            else:
                # 自动缩放：常数曲线也可见
                # 注意：时间轴下 get_xlim() 已经是浮点日期
                x0_num, x1_num = ax.get_xlim()
                x0_num = float(x0_num)
                x1_num = float(x1_num)

                ymins, ymaxs = [], []
                for line in ax.get_lines():
                    x = line.get_xdata(orig=False)
                    if len(x) == 0:
                        continue
                    # 如果 x 是 datetime 序列，转成浮点日期；否则保持为数值
                    if hasattr(x[0], "year"):
                        x_num = mdates.date2num(x)
                    else:
                        try:
                            x_num = np.asarray(x, dtype=float)
                        except Exception:
                            # 兜底：强转为浮点日期（极少见）
                            x_num = mdates.date2num(x)
                    y = line.get_ydata(orig=False)
                    m = (x_num >= x0_num) & (x_num <= x1_num) & np.isfinite(y)
                    if m.any():
                        ymins.append(float(np.nanmin(y[m])))
                        ymaxs.append(float(np.nanmax(y[m])))

                if ymins and ymaxs:
                    lo, hi = float(np.min(ymins)), float(np.max(ymaxs))
                    if not np.isfinite(lo) or not np.isfinite(hi):
                        lo, hi = 0.0, 1.0
                    elif hi <= lo:
                        v = lo
                        pad = max(1e-6, abs(v) * 0.02)
                        lo, hi = v - pad, v + pad
                    else:
                        pad = 0.05 * (hi - lo)
                        lo, hi = lo - pad, hi + pad
                    ax.set_ylim(lo, hi)
            ax.legend(ncol=3, fontsize=9, loc="upper right")

        fig.autofmt_xdate()
        plt.tight_layout()
        plt.show()


if __name__ == '__main__':
    ip_address = '192.168.1.9' #根据自己灵巧手IP做修改
    port = 6000
    rh = RH56DFTP_hand(ip_address, port, is_connect=True)
    rh.normal()
    rh.pre_catch()
    rh.catch()

    print("版本号=", rh.read_firmware_version())

    try:
        # 120 Hz 取样，30 FPS 绘图
        rh.read_multiple_registers_map(duration_sec=0,
                                       target_hz=120,
                                       gui_fps=30,
                                       save_png_every=0)
        
        # 触觉数据回放，在没有连接灵巧手时，可以通过 rh = RH56DFTP_hand(ip_address, port, is_connect=False)
        # rh.replay_log("/home/galaxy/logs/tactile_test.jsonl",
        #       fps=8,     # 原始纪录采样≈8 Hz
        #       speed=2.0, # 2×倍速
        #       loop=False)

        # 打印angleAct/angleSet 与 forceAct/forceSet 曲线
        # rh.plot_joints("logs/joints_20251011_232126.csv",
        #                     show=("angleAct", "forceAct"),   # 可选: angleAct/angleSet/forceAct/forceSet
        #                     fingers=(1, 2, 3, 4, 5, 6),
        #                     lock_ylim=False,
        #                     tlim=None)  
    finally:
        pass
    rh.disconnect()