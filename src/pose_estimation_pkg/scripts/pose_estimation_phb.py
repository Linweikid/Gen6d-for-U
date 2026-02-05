#!/usr/bin/env python
# -*- coding: utf-8 -*-
# rose相关包
import rospy
from pose_estimation_pkg.msg import Pose6D
# 位姿估计相关包
# import sys
# import os
# # 关键：获取当前脚本的目录，并添加到Python路径
# sys.path.append(os.path.dirname(__file__))
from estimater import *
from datareader import *
import argparse
# from hardware.RM65_6FB import *
from twoca import RealSenseDualCapture
from formask2 import get_box_binary_mask
from scipy.spatial.transform import Rotation as R
from realsense_reader import ros_img_to_cv2
from sensor_msgs.msg import Image
from Foundationclass import PoseEstimator



def get_poll(pose):
    if pose[0][0] > 0:
        T1 = np.array([[0, 1, 0, 0],
                    [1, 0, 0, 0],
                    [0, 0, -1, 0],
                    [0, 0, 0, 1]])
    else:
        T1 = np.array([[0, -1, 0, 0],
                    [1, 0, 0, 0],
                    [0, 0, 1, 0],
                    [0, 0, 0, 1]])
    pose2 = np.dot(pose,T1)
    return pose2

def pose_to_matrix(pose):
    T = np.eye(4)
    T[:3, 3] = np.array(pose[:3])
    T[:3, :3] = R.from_euler('xyz', pose[3:], degrees=False).as_matrix()
    return T

def matrix_to_pose(matrix):
    pose = np.zeros(6)
    pose[:3] = matrix[:3, 3]
    r = R.from_matrix(matrix[:3, :3])
    pose[3:] = r.as_euler('xyz')
    return pose

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

if __name__ == '__main__':
    # rose初始话并建立U型管位姿话题
    rospy.init_node("pose_estimator")
    u_pub = rospy.Publisher("/target_u_pose", Pose6D, queue_size=1)
    h_pub = rospy.Publisher("/target_h_pose", Pose6D, queue_size=1)
    rate = rospy.Rate(1)  # 30Hz 随便
    u = Pose6D()
    H = Pose6D()
    color_image = None
    depth_image = None
    try:
        color_topic = "/camera1/color/image_raw"
        depth_topic = "/camera1/aligned_depth_to_color/image_raw"  # 对齐后的深度图
        rospy.Subscriber(color_topic, Image, color_callback)
        rospy.Subscriber(depth_topic, Image, depth_callback)
        rospy.loginfo("成功订阅彩色话题: %s", color_topic)
    except Exception as e:
        rospy.logfatal("订阅话题失败！错误：%s", str(e))
    # 参数解析
    parser = argparse.ArgumentParser()
    code_dir = os.path.dirname(os.path.realpath(__file__))
    parser.add_argument('--mesh_file', type=str, default=f'{code_dir}/demo_data/Uguan/mesh/Uguan.obj')
    parser.add_argument('--test_scene_dir', type=str, default=f'{code_dir}/demo_data/Uguan')
    parser.add_argument('--est_refine_iter', type=int, default=7)
    parser.add_argument('--track_refine_iter', type=int, default=5)
    parser.add_argument('--debug', type=int, default=3)
    parser.add_argument('--debug_dir', type=str, default=f'{code_dir}/debug')
    args = parser.parse_args(args=[])
    estimator = PoseEstimator()
    
    set_logging_format()
    set_seed(0)
    i = 0
    mesh = trimesh.load(args.mesh_file)

    debug = args.debug
    debug_dir = args.debug_dir
    os.system(f'rm -rf {debug_dir}/* && mkdir -p {debug_dir}/track_vis1 {debug_dir}/ob_in_cam')
    to_origin, extents = trimesh.bounds.oriented_bounds(mesh)
    bbox = np.stack([-extents / 2, extents / 2], axis=0).reshape(2, 3)

    scorer = ScorePredictor()
    refiner = PoseRefinePredictor()
    glctx = dr.RasterizeCudaContext()
    est = FoundationPose(model_pts=mesh.vertices, model_normals=mesh.vertex_normals, mesh=mesh, scorer=scorer,
                         refiner=refiner, debug_dir=debug_dir, debug=debug, glctx=glctx)
    logging.info("estimator initialization done")
    capture = RealSenseDualCapture()
    reader = YcbineoatReader(video_dir=args.test_scene_dir, shorter_side=None, zfar=np.inf)
    tool_pose2 = [0, 0, 0, 0, np.pi / 6, -np.pi / 2]
    matrixcam = np.array([[0.02016184, 0.83121816, 0.55558067, 0.09366171],
                            [0.0124392, -0.55585916, 0.83118341, 0.16732347],
                            [0.99971934, -0.0098472, -0.02154684, -0.14048997],
                            [0, 0, 0, 1]])
    try:
        while not rospy.is_shutdown():
            depth_meters = depth_image.astype(np.float32) / 1000.0
            processed_depth = cv2.resize(depth_meters, (640, 480), interpolation=cv2.INTER_NEAREST)
            print("000000000")
            mask = get_box_binary_mask(color_image, i)
            print("330000000")
            if mask is None:
                tool_pose2 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]  # 自定义默认值
                rospy.logwarn("未检测到物体，使用默认tool_pose2：%s", tool_pose2)
                cv2.imshow('1', color_image)
            else:
                pose = est.register(K=reader.K, rgb=color_image, depth=processed_depth, ob_mask=mask,
                                    iteration=args.est_refine_iter)
                center_pose = pose @ np.linalg.inv(to_origin)
                vis = draw_posed_3d_box(reader.K, img=color_image, ob_in_cam=center_pose, bbox=bbox)
                vis = draw_xyz_axis(color_image, ob_in_cam=center_pose, scale=0.1, K=reader.K, thickness=3, transparency=0,
                                    is_input_rgb=True)
                # 获取相对于相机1位姿（粗位置）
                pose2 = get_poll(pose)
                tool_pose = matrixcam @ pose2
                tool_pose2 = matrix_to_pose(tool_pose)
                # print("obj_pose = ",obj_pose)
                print(tool_pose2)

            # #眼在手上的相机获取obj相对于base
            # eal_ft, pose3 = rh.rm_force_compensation()
            # matrixtool = pose_to_matrix(pose3)
            # matrixcam = np.array([[0.97715164, -0.20838527, -0.04183603, -0.05184375],
            #                         [0.20972529, 0.91338624, 0.34891386, -0.08629626],
            #                         [-0.03449605, -0.34971583, 0.93622052, 0.03872601],
            #                        [0, 0, 0, 1]])
            # tool_pose = matrixtool @ matrixcam @ pose
            # tool_pose2 = matrix_to_pose(tool_pose)
            # print(tool_pose2)

                cv2.imshow('1', vis[..., ::-1])
                cv2.waitKey(1)  # 等待按键
                os.makedirs(f'{debug_dir}/track_vis', exist_ok=True)
                imageio.imwrite(f'{debug_dir}/track_vis/{i}.png', vis)  # 直接使用变量 i 作为文件名
                i = i + 1

            # 发布话题信息
            obj_pose2 = estimator.run(color_image, depth_image)
            u.x = tool_pose2[0]
            u.y = tool_pose2[1]
            u.z = tool_pose2[2]
            u.rx = tool_pose2[3]
            u.ry = tool_pose2[4]
            u.rz = tool_pose2[5]
            u_pub.publish(u)
            
            H.x = obj_pose2[0]
            H.y = obj_pose2[1]
            H.z = obj_pose2[2]
            H.rx = obj_pose2[3]
            H.ry = obj_pose2[4]
            H.rz = obj_pose2[5]
            h_pub.publish(H)
            rate.sleep()

    except KeyboardInterrupt:
        print("wrroy")
    # 出错终止
    except Exception as e:
        rospy.logerr(f"节点运行出错：{str(e)}")
    # 无论是否异常，都执行资源释放
    finally:
        rospy.loginfo("节点退出，释放资源（如相机、串口）")
        # 关闭OpenCV窗口
        cv2.destroyAllWindows()