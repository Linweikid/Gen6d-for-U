#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rospy
from pose_estimation_pkg.msg import Pose6D # 确保导入正确的消息类型

class MultiPoseRelayNode:
    """
    一个多位姿中继节点。
    它订阅两个低频位姿话题，并以高频分别重新发布它们最新的位姿。
    新增逻辑：接收到全零位姿时，使用历史有效位姿，不更新缓存
    """
    def __init__(self):
        # --- 1. 初始化 ROS 节点 ---
        rospy.init_node('multi_pose_relay_node', anonymous=True)
        rospy.loginfo("多位姿中继节点已启动。")

        # --- 2. 定义话题名称和发布频率 ---
        self.subscription_topic_h = rospy.get_param('~sub_topic_h', '/target_h_pose01')
        self.subscription_topic_u = rospy.get_param('~sub_topic_u', '/target_u_pose01')

        self.publisher_topic_h = rospy.get_param('~pub_topic_h', '/target_h_pose_coarse1')
        self.publisher_topic_u = rospy.get_param('~pub_topic_u', '/target_u_pose1')

        self.publish_rate_hz = rospy.get_param('~publish_rate', 30.0)

        rospy.loginfo("正在订阅: %s", self.subscription_topic_h)
        rospy.loginfo("正在订阅: %s", self.subscription_topic_u)
        rospy.loginfo("将以 %f Hz 的频率发布到: %s", self.publish_rate_hz, self.publisher_topic_h)
        rospy.loginfo("将以 %f Hz 的频率发布到: %s", self.publish_rate_hz, self.publisher_topic_u)

        # --- 3. 创建订阅器和发布器 ---
        self.sub_h = rospy.Subscriber(self.subscription_topic_h, Pose6D, self.pose_h_callback)
        self.pub_h = rospy.Publisher(self.publisher_topic_h, Pose6D, queue_size=10)

        self.sub_u = rospy.Subscriber(self.subscription_topic_u, Pose6D, self.pose_u_callback)
        self.pub_u = rospy.Publisher(self.publisher_topic_u, Pose6D, queue_size=10)

        # --- 4. 初始化状态变量 ---
        self.latest_pose_msg_h = None  # h 位姿缓存（存储有效历史位姿）
        self.latest_pose_msg_u = None  # u 位姿缓存（存储有效历史位姿）
        self.rate = rospy.Rate(self.publish_rate_hz)

    def is_all_zero_pose(self, msg):
        """
        辅助函数：判断 Pose6D 消息是否为全零位姿 [0,0,0,0,0,0]
        考虑浮点精度问题，用绝对值小于极小值（1e-6）判断
        """
        pose_values = [msg.x, msg.y, msg.z, msg.rx, msg.ry, msg.rz]
        return all(abs(val) < 1e-6 for val in pose_values)

    def pose_h_callback(self, msg):
        """订阅器 h_pose 的回调函数：仅接收非全零位姿"""
        if self.is_all_zero_pose(msg):
            rospy.logdebug("收到 h_pose 全零位姿，不更新缓存")
            return  # 全零则不更新，保留历史有效位姿
        self.latest_pose_msg_h = msg
        rospy.logdebug("收到新的 h_pose，已更新缓存。")

    def pose_u_callback(self, msg):
        """订阅器 u_pose 的回调函数：仅接收非全零位姿"""
        if self.is_all_zero_pose(msg):
            rospy.logdebug("收到 u_pose 全零位姿，不更新缓存")
            return  # 全零则不更新，保留历史有效位姿
        self.latest_pose_msg_u = msg
        rospy.logdebug("收到新的 u_pose，已更新缓存。")

    def run(self):
        """节点的主循环：高频发布历史有效位姿"""
        rospy.loginfo("多位姿中继节点开始高频发布...")

        while not rospy.is_shutdown():
            # 发布 h_pose：有缓存则发布，无则提示
            if self.latest_pose_msg_h is not None:
                self.pub_h.publish(self.latest_pose_msg_h)
            else:
                rospy.logwarn_throttle(5, "尚未收到 h_pose 有效消息，等待中...")

            # 发布 u_pose：有缓存则发布，无则提示
            if self.latest_pose_msg_u is not None:
                self.pub_u.publish(self.latest_pose_msg_u)
            else:
                rospy.logwarn_throttle(5, "尚未收到 u_pose 有效消息，等待中...")

            # 按照设定的频率休眠
            self.rate.sleep()

if __name__ == '__main__':
    try:
        relay_node = MultiPoseRelayNode()
        relay_node.run()
    except rospy.ROSInterruptException:
        rospy.loginfo("多位姿中继节点被中断，正在关闭...")
    except Exception as e:
        rospy.logerr(f"多位姿中继节点发生错误: {e}")