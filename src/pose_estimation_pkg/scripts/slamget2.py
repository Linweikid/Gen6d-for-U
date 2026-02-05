
from estimater import *
from datareader import *
import argparse
from hardware.RM65_6FB import *
#from get_png import RealSenseSingleFrameCapture
from twoca import RealSenseDualCapture
from formask2 import get_box_binary_mask1
from peg_in_hole_static import *
from scipy.spatial.transform import Rotation as R

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

def write_pose_to_file(pose, mode='a'):
    """
    将一个位姿数据写入到txt文件中。

    :param file_path: 文件路径。
    :param pose: 位姿数据，格式为 [x, y, z, rx, ry, rz]。
    :param mode: 文件打开模式，'a' 为追加（默认），'w' 为覆盖写入。
    """
    file_path = "demo_data/slam/cemera1.txt"
    # 将numpy数组转换为列表，方便后续处理
    if isinstance(pose, np.ndarray):
        pose = pose.tolist()

    # 保留4位小数，保证数据精度和格式统一
    pose_str = " ".join(f"{coord:.4f}" for coord in pose)

    try:
        with open(file_path, mode) as f:
            f.write(pose_str + "\n")
        # print(f"位姿已写入文件: {pose_str}")
    except IOError as e:
        print(f"写入文件失败: {e}")

def pose_to_matrix(pose):
  T = np.eye(4)
  T[:3, 3] = np.array(pose[:3])
  T[:3, :3] = R.from_euler('xyz', pose[3:], degrees=False).as_matrix()
  return  T

def matrix_to_pose(matrix):
  pose = np.zeros(6)
  pose[:3] = matrix[:3, 3]
  r = R.from_matrix(matrix[:3, :3])
  pose[3:] = r.as_euler('xyz')
  return pose

if __name__=='__main__':
  parser = argparse.ArgumentParser()
  code_dir = os.path.dirname(os.path.realpath(__file__))
  #parser.add_argument('--mesh_file', type=str, default=f'{code_dir}/demo_data/mustard0/mesh/textured_simple.obj')
  #parser.add_argument('--test_scene_dir', type=str, default=f'{code_dir}/demo_data/mustard0')
  parser.add_argument('--mesh_file', type=str, default=f'{code_dir}/demo_data/Uguan2/mesh/Uguan.obj')
  parser.add_argument('--test_scene_dir', type=str, default=f'{code_dir}/demo_data/Uguan2')
  parser.add_argument('--est_refine_iter', type=int, default=7)
  parser.add_argument('--track_refine_iter', type=int, default=5)
  parser.add_argument('--debug', type=int, default=3)
  parser.add_argument('--debug_dir', type=str, default=f'{code_dir}/debug')
  args = parser.parse_args()
  set_logging_format()
  set_seed(0)
  i = 0
  mesh = trimesh.load(args.mesh_file)

  debug = args.debug
  debug_dir = args.debug_dir
  os.system(f'rm -rf {debug_dir}/* && mkdir -p {debug_dir}/track_vis {debug_dir}/ob_in_cam')

  to_origin, extents = trimesh.bounds.oriented_bounds(mesh)
  bbox = np.stack([-extents/2, extents/2], axis=0).reshape(2,3)

  scorer = ScorePredictor()
  refiner = PoseRefinePredictor()
  glctx = dr.RasterizeCudaContext()
  est = FoundationPose(model_pts=mesh.vertices, model_normals=mesh.vertex_normals, mesh=mesh, scorer=scorer, refiner=refiner, debug_dir=debug_dir, debug=debug, glctx=glctx)
  logging.info("estimator initialization done")
  capture = RealSenseDualCapture()
  reader = YcbineoatReader(video_dir=args.test_scene_dir, shorter_side=None, zfar=np.inf)
  print("2")
  # rh = RM65_6F(robot_ip="192.168.1.19", port=8080, is_use_ys_gripper=False, is_use_camera=True)

  try:
      while True:
        frame_data = capture.get_cam2_frame()
        color_image = frame_data['color_image']
        depth_image = frame_data['depth_image']
        depth_meters = depth_image.astype(np.float32) / 1000.0
        processed_depth = cv2.resize(depth_meters, (640, 480), interpolation=cv2.INTER_NEAREST)
        mask = get_box_binary_mask1(color_image, i)
        pose = est.register(K=reader.K, rgb=color_image, depth=processed_depth, ob_mask=mask, iteration=args.est_refine_iter)
        center_pose = pose@np.linalg.inv(to_origin)
        vis = draw_posed_3d_box(reader.K, img=color_image, ob_in_cam=center_pose, bbox=bbox)
        vis = draw_xyz_axis(color_image, ob_in_cam=center_pose, scale=0.1, K=reader.K, thickness=3, transparency=0, is_input_rgb=True)
        
        obj_pose = [0, 0, 0, 0, np.pi/6, -np.pi/2]
        # 获取相机1（粗位置）
        # print("obj_pose = ",obj_pose)
        print(pose)
        # 相机1检测物体相对于base的转换
        # 眼在手外的相机获取obj相对于base
        matrixcam = np.array([[0.02016184, 0.83121816, 0.55558067, 0.09366171],
                                [0.0124392, -0.55585916, 0.83118341, 0.16732347],
                                [0.99971934, -0.0098472, -0.02154684, -0.14048997],
                                [0, 0, 0, 1]])
        pose2 = get_poll(pose)
        tool_pose = matrixcam @ pose2
        tool_pose2 = matrix_to_pose(tool_pose)
        # print("obj_pose = ",obj_pose)
        print(tool_pose2)
        # write_pose_to_file(tool_pose, mode='a')

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
        # write_pose_to_file(tool_pose2)
        cv2.imshow('1', vis[...,::-1])
        cv2.waitKey(1)  # 等待按键
        os.makedirs(f'{debug_dir}/track_vis', exist_ok=True)
        imageio.imwrite(f'{debug_dir}/track_vis/{i}.png', vis)  # 直接使用变量 i 作为文件名
        i = i + 1
        print(i)
        key = cv2.waitKey(5000)
      
  except KeyboardInterrupt:
    print("wrroy")
  #rh.disconnect_robot()