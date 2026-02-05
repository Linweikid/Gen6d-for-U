#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rospy
from pose_estimation_pkg.msg import Pose6D # 确保导入正确的消息类型
from ultralytics import YOLO
import numpy as np
import cv2
import os
from realsense_reader import ros_img_to_cv2
from sensor_msgs.msg import Image

# 全局变量
color_image = None
# 提前加载YOLO模型（只加载一次，避免重复加载浪费资源）
model = None
# 初始化h和u的姿态（全局变量，方便实时更新）
u = Pose6D()
h = Pose6D()
h2 = Pose6D()

def init_yolo_model():
    """初始化YOLO模型（只执行一次）"""
    global model
    model_path = "/media/jt/73B26804703F8EDC/rm-pose/runs/detect/xiongqianU2/weights/best.pt"
    if os.path.exists(model_path):
        model = YOLO(model_path)
        rospy.loginfo("YOLO模型加载成功！")
    else:
        rospy.logfatal(f"YOLO模型文件不存在：{model_path}")
        rospy.signal_shutdown("模型文件缺失")

def get_two_box_mask2(image):
    """检测图片中类别1的目标数量（增加非空判断）"""
    global model
    # 空图片直接返回0
    if image is None or model is None:
        return 0
    
    # 执行YOLO检测
    results = model(image, imgsz=640, conf=0.5)  # conf为置信度阈值，可调整
    
    # 获取原图尺寸，创建空白二值化画布（初始全黑）
    h_img, w_img = image.shape[:2]
    binary_mask = np.zeros((h_img, w_img), dtype=np.uint8)  # 0表示黑色
    
    # 检查是否有检测结果
    class1_count = 0
    if results and len(results[0].boxes) > 0:
        box_list = []
        for idx, box in enumerate(results[0].boxes):
            cls_id = int(box.cls.cpu().numpy())
            if cls_id == 0:
                x1, y1, x2, y2 = map(int, box.xyxy[0].cpu().numpy())
                box_list.append((x1, y1, x2, y2, idx))
        class1_count = len(box_list)
        rospy.loginfo(f"【图像】类别1的识别个数:{class1_count}")
    return class1_count

def update_h_pose(countH):
    """根据检测数量更新h的姿态值"""
    # 先重置为0
    h.x = 0
    h.y = 0
    h.z = 0
    h.rx = 0
    h.ry = 0
    h.rz = 0
    countH = 0
    # 用字典映射替代多个if，更简洁
    pose_map = {
        11: (0.3081, 0.5348, 0.039, 1.52, 0.04, -3.113),
        10: (0.3068, 0.5332, 0.1273, 1.53, 0.04, -3.113),
        9: (0.3006, 0.5333, 0.1728, 1.54, 0.04, -3.113),
        8: (0.3005, 0.532, 0.2167, 1.54, 0.04, -3.113),
        7: (0.299, 0.5314, 0.2613, 1.54, 0.04, -3.113),
        6: (0.294, 0.5309, 0.3063, 1.54, 0.04, -3.113),
        #14: (0.29225, 0.5285, 0.396, 1.54, 0.04, -3.113)
        5: (0.29225, 0.5305, 0.3487, 1.54, 0.04, -3.113),
        # 16: (0.2987, 0.5285, 0.44, 1.54, 0.04, -3.113),
        0: (0.285, 0.52688, 0.529, 1.54, 0.04, -3.113)
    }
    
    # 匹配到对应数量则更新
    if countH in pose_map:
        h.x, h.y, h.z, h.rx, h.ry, h.rz = pose_map[countH]

def update_h2_pose(countH):
    """根据检测数量更新h的姿态值"""
    # 先重置为0
    h2.x = 0
    h2.y = 0
    h2.z = 0
    h2.rx = 0
    h2.ry = 0
    h2.rz = 0
    countH = 0
    # 用字典映射替代多个if，更简洁
    
    pose_map = {
        11: (0.3081, 0.5348, 0.039, 1.52, 0.04, -3.113),
        10: (0.3068, 0.5332, 0.1273, 1.53, 0.04, -3.113),
        9: (0.3006, 0.5333, 0.1728, 1.54, 0.04, -3.113),
        8: (0.3005, 0.532, 0.2167, 1.54, 0.04, -3.113),
        7: (0.299, 0.5314, 0.2613, 1.54, 0.04, -3.113),
        6: (0.294, 0.5309, 0.3063, 1.54, 0.04, -3.113),
        #14: (0.29225, 0.5285, 0.396, 1.54, 0.04, -3.113)
        5: (0.29225, 0.5305, 0.3487, 1.54, 0.04, -3.113),
        # 16: (0.2987, 0.5285, 0.44, 1.54, 0.04, -3.113),
        0: (0.285, 0.52688, 0.529, 1.54, 0.04, -3.113)
    }
    # pose_map = {
    #     11: (0.3081, 0.6846, 0.0392, 1.52, 0.04, -3.113),
    #     10: (0.3068, 0.6318, 0.1263, 1.54, 0.04, -3.113),
    #     9: (0.3006, 0.5813, 0.1728, 1.54, 0.04, -3.113),
    #     8: (0.3005, 0.5798, 0.2167, 1.54, 0.04, -3.113),
    #     7: (0.299, 0.5394, 0.2613, 1.54, 0.04, -3.113),
    #     6: (0.294, 0.5389, 0.307, 1.54, 0.04, -3.113),
    #     #14: (0.29225, 0.5285, 0.396, 1.54, 0.04, -3.113)
    #     5: (0.29225, 0.5305, 0.3465, 1.54, 0.04, -3.113),
    #     # 16: (0.2987, 0.5285, 0.44, 1.54, 0.04, -3.113),
    #     16: (0.2928, 0.577, 0.48613, 1.54, 0.04, -3.113)
    # }
    
    # 匹配到对应数量则更新
    if countH in pose_map:
        h2.x, h2.y, h2.z, h2.rx, h2.ry, h2.rz = pose_map[countH]

def color_callback(msg):
    """ROS图片回调函数：更新全局color_image"""
    global color_image
    try:
        color_image = ros_img_to_cv2(msg, desired_encoding="bgr8")
    except Exception as e:
        rospy.logerr("[Color Callback] 转换错误: %s", e)

if __name__ == '__main__':
    try:
        rospy.init_node("pose_push3")
        
        # 1. 初始化YOLO模型（只加载一次）
        init_yolo_model()
        
        # 2. 初始化u的姿态（固定值）
        u.x = 0.3009
        u.y = 0.2935
        u.z = 0.688
        u.rx = 0.467
        u.ry = 0.013
        u.rz = -3.1
        
        # 3. 订阅彩色图片话题
        color_topic = "/camera2/color/image_raw"
        rospy.Subscriber(color_topic, Image, color_callback)
        rospy.loginfo("成功订阅彩色话题: %s", color_topic)
        
        # 4. 创建发布者
        u_pub = rospy.Publisher("/target_u_pose_coarse1", Pose6D, queue_size=1)
        u2_pub = rospy.Publisher("/target_u_pose_fine1", Pose6D, queue_size=1)
        h_pub = rospy.Publisher("/target_h_pose_fine1", Pose6D, queue_size=1)
        h2_pub = rospy.Publisher("/target_h_pose_coarse1", Pose6D, queue_size=1)
        
        # 5. 设置循环频率（10Hz）
        rate = rospy.Rate(10)
        
        rospy.loginfo("节点启动成功，开始循环发布姿态...")
        
        # 6. 主循环：实时检测+更新姿态+发布
        while not rospy.is_shutdown():
            # 每次循环都检测最新的图片，更新h的姿态
            countH = get_two_box_mask2(color_image)
            update_h_pose(countH)
            update_h2_pose(countH)
            # 发布姿态
            u_pub.publish(u)
            u2_pub.publish(u)
            h_pub.publish(h)
            h2_pub.publish(h2)
            rate.sleep()
            
    except KeyboardInterrupt:
        rospy.logwarn("用户手动中断程序")
    except Exception as e:
        rospy.logerr(f"节点运行出错：{str(e)}")
    finally:
        rospy.loginfo("节点退出，释放资源（如相机、串口）")
