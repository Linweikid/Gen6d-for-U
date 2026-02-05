#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import rospy
from pose_estimation_pkg.msg import Pose6D

def main():
    rospy.init_node("pose_estimator")

    u_pub = rospy.Publisher("/target_u_pose", Pose6D, queue_size=1)
    h_pub = rospy.Publisher("/target_h_pose", Pose6D, queue_size=1)

    rate = rospy.Rate(30)  # 30Hz 随便

    while not rospy.is_shutdown():
        # 这里替换成你视觉估计出来的结果
        # 注意单位要和 RealMan 一致：m + rad
        u = Pose6D()
        u.x  = 0.32922
        u.y  = 0.48758 
        u.z  = 0.06308
        u.rx = 1.5714
        u.ry = -0.093487
        u.rz = -3.0574

        h = Pose6D()
        h.x  = 0.32922
        h.y  = 0.48758
        h.z  = 0.06308
        h.rx = 1.5714
        h.ry = -0.093487
        h.rz = -3.0574

        u_pub.publish(u)
        h_pub.publish(h)

        rate.sleep()
        rospy.loginfo("u_pub = %s", u)
        rospy.loginfo("h_pub = %s", h)

if __name__ == "__main__":
    main()
