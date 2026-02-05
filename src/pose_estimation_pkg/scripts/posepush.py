#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rospy
from pose_estimation_pkg.msg import Pose6D # 确保导入正确的消息类型


if __name__ == '__main__':
    try:
        rospy.init_node("pose_push1")
        u_pub = rospy.Publisher("/target_u_pose_fine1", Pose6D, queue_size=1)
        h_pub = rospy.Publisher("/target_h_pose1", Pose6D, queue_size=1)
        rate = rospy.Rate(1)  # 30Hz 随便
        u = Pose6D()
        h = Pose6D()
        u.x = 0.3012
        u.y = 0.2907
        u.z = 0.700
        u.rx = 0.453
        u.ry = 0.013
        u.rz = -3.1
        h.x = 0.3081
        h.y = 0.5321
        h.z = 0.0398
        h.rx = 1.54
        h.ry = 0.04
        h.rz = -3.113
        # h.x = 0.28847
        # h.y = 0.54024
        # h.z = 0.053484
        # h.rx = 1.6055
        # h.ry = 0.014822
        # h.rz = -3.06
        rate = rospy.Rate(10)
        while not rospy.is_shutdown():
            u_pub.publish(u)
            h_pub.publish(h)
            rate.sleep()

    except KeyboardInterrupt:
        print("wrroy")
    # 出错终止
    except Exception as e:
        rospy.logerr(f"节点运行出错：{str(e)}")
    # 无论是否异常，都执行资源释放
    finally:
        rospy.loginfo("节点退出，释放资源（如相机、串口）")