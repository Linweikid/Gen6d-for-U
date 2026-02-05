#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import rospy
import cv2
import numpy as np
# from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image

# 全局变量
# bridge = CvBridge()
color_image = None
depth_image = None

def ros_img_to_cv2(img_msg, desired_encoding="bgr8"):
    """
    手动将ROS Image消息转为OpenCV格式，替代 cv_bridge.imgmsg_to_cv2
    :param img_msg: sensor_msgs/Image 消息
    :param desired_encoding: 目标编码（bgr8/rgb8/16UC1/mono8等）
    :return: OpenCV格式的numpy数组
    """
    # 1. 解析Image消息的元信息
    width = img_msg.width
    height = img_msg.height
    encoding = img_msg.encoding
    data = img_msg.data
    step = img_msg.step  # 每行字节数（用于处理对齐）

    # 2. 将二进制数据转为numpy数组（原始格式）
    # 根据编码确定数据类型
    dtype_map = {
        "8UC1": np.uint8, "mono8": np.uint8,
        "8UC3": np.uint8, "bgr8": np.uint8, "rgb8": np.uint8,
        "16UC1": np.uint16, "mono16": np.uint16,
    }
    if encoding not in dtype_map:
        raise ValueError(f"不支持的编码格式: {encoding}")
    dtype = dtype_map[encoding]

    # 处理step对齐问题（避免数组形状错误）
    if step == width * np.dtype(dtype).itemsize * (3 if "8UC3" in encoding or "bgr8" in encoding or "rgb8" in encoding else 1):
        # 无对齐，直接reshape
        img_arr = np.frombuffer(data, dtype=dtype).reshape((height, width, -1))
    else:
        # 有对齐，按行截取有效数据
        img_arr = np.frombuffer(data, dtype=dtype).reshape((height, step // np.dtype(dtype).itemsize))
        img_arr = img_arr[:, :width * (3 if "8UC3" in encoding or "bgr8" in encoding or "rgb8" in encoding else 1)]
        img_arr = img_arr.reshape((height, width, -1))

    # 3. 转换为目标编码
    if desired_encoding == "bgr8":
        if encoding == "rgb8":
            img_arr = cv2.cvtColor(img_arr, cv2.COLOR_RGB2BGR)
        elif encoding == "bgr8":
            pass  # 无需转换
        else:
            raise ValueError(f"无法从 {encoding} 转换为 bgr8")
    elif desired_encoding == "16UC1":
        if encoding == "16UC1" or encoding == "mono16":
            img_arr = img_arr.squeeze()  # 去掉多余维度（height, width, 1）→ (height, width)
        else:
            raise ValueError(f"无法从 {encoding} 转换为 16UC1")
    elif desired_encoding == "mono8":
        img_arr = img_arr.squeeze()
    else:
        raise ValueError(f"暂不支持目标编码: {desired_encoding}")

    return img_arr

# ===================== 回调函数（替换cv_bridge调用） =====================
def color_callback(msg):
    global color_image
    try:
        color_image = ros_img_to_cv2(msg, desired_encoding="bgr8")
    except Exception as e:
        rospy.logerr("[Color Callback] 转换错误: %s", e)

def depth_callback(msg):
    global depth_image
    try:
        depth_image = ros_img_to_cv2(msg, desired_encoding="16UC1")
    except Exception as e:
        rospy.logerr("[Depth Callback] 转换错误: %s", e)

# # 彩色图像回调函数
# def color_callback(msg):
#     global color_image
#     try:
#         # 将ROS图像消息转换为OpenCV格式（BGR8）
#         color_image = bridge.imgmsg_to_cv2(msg, "bgr8")

#     except CvBridgeError as e:
#         rospy.logerr("CvBridge error: %s", e)
# # 深度图像回调函数
# def depth_callback(msg):
#     global depth_image
#     try:
#         # 深度图像格式为16UC1（单位：mm）
#         depth_image = bridge.imgmsg_to_cv2(msg, "16UC1")
#     except CvBridgeError as e:
#         rospy.logerr("CvBridge error: %s", e)


def get_realsense_images():
    """
    读取当前最新的彩色和深度图像,返回NumPy数组
    """
    # 彩色图像转NumPy数组（OpenCV图像本身就是NumPy数组，直接返回即可）
    color_np = color_image.copy() if color_image is not None else None

    # 深度图像转NumPy数组
    depth_np = depth_image.copy() if depth_image is not None else None

    return color_np, depth_np

def main():
    # 初始化ROS节点
    rospy.init_node('realsense_reader', anonymous=True)
    print("0")
    # 订阅话题（若开启align_depth，深度话题为/aligned_depth_to_color/image_raw）
    try:
        color_topic = "/camera/color/image_raw"
        depth_topic = "/camera/aligned_depth_to_color/image_raw"  # 对齐后的深度图
        # depth_topic = "/camera/depth/image_raw"  # 原始深度图（未对齐）
        rospy.loginfo("成功订阅彩色话题: %s", color_topic)
        rospy.loginfo("成功订阅深度话题: %s", depth_topic)
        print("1")
    except Exception as e:
        rospy.logfatal("订阅话题失败！错误：%s", str(e))
        return

    # 订阅彩色和深度图像
    rospy.Subscriber(color_topic, Image, color_callback)
    rospy.Subscriber(depth_topic, Image, depth_callback)
    print("0")
    rospy.loginfo("开始读取RealSense D455图像...")
    
    # 设置显示窗口
    cv2.namedWindow("Color Image", cv2.WINDOW_NORMAL)
    cv2.resizeWindow("Color Image", 640, 480)
    cv2.namedWindow("Depth Image", cv2.WINDOW_NORMAL)
    cv2.resizeWindow("Depth Image", 640, 480)

    # 循环频率（1Hz）
    rate = rospy.Rate(30)

    while not rospy.is_shutdown():
        if color_image is not None:
            # 显示彩色图像
            cv2.imshow("Color Image", color_image)
        else: print("wwwww")
        if depth_image is not None:
            # 深度图像归一化（便于可视化，转换为8位灰度图）
            depth_norm = cv2.normalize(depth_image, None, 0, 255, cv2.NORM_MINMAX, cv2.CV_8U)
            cv2.imshow("Depth Image", depth_norm)
        # 按键退出（按q键）
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

        rate.sleep()

    # 释放资源
    cv2.destroyAllWindows()


if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print("wrroy")
    except rospy.ROSInterruptException:
        pass