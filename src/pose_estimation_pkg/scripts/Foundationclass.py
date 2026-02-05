from estimater import *
from datareader import *
import argparse
import os
import cv2
import imageio
import trimesh
import numpy as np
from scipy.spatial.transform import Rotation as R
from formask2 import get_two_box_mask


class PoseEstimator:
    def __init__(self):
        self.args = self._parse_args()
        self._init_environment()
        self.mesh = trimesh.load(self.args.mesh_file)
        self.to_origin, self.extents = trimesh.bounds.oriented_bounds(self.mesh)
        self.bbox = np.stack([-self.extents / 2, self.extents / 2], axis=0).reshape(2, 3)
        self.scorer = ScorePredictor()
        self.refiner = PoseRefinePredictor()
        self.glctx = dr.RasterizeCudaContext()
        self.est = self._init_estimator()
        self.reader = YcbineoatReader(
            video_dir=self.args.test_scene_dir,
            shorter_side=None,
            zfar=np.inf
        )
        self.i = 10

    def _parse_args(self):
        parser = argparse.ArgumentParser()
        code_dir = os.path.dirname(os.path.realpath(__file__))
        parser.add_argument('--mesh_file', type=str, default=f'{code_dir}/demo_data/Ulian/mesh/Ulian.obj')
        parser.add_argument('--test_scene_dir', type=str, default=f'{code_dir}/demo_data/Ulian')
        parser.add_argument('--est_refine_iter', type=int, default=7)
        parser.add_argument('--track_refine_iter', type=int, default=5)
        parser.add_argument('--debug', type=int, default=3)
        parser.add_argument('--debug_dir', type=str, default=f'{code_dir}/debug')
        return parser.parse_args(args=[])

    def _init_environment(self):
        set_logging_format()
        set_seed(0)
        os.system(
            f'rm -rf {self.args.debug_dir}/* && mkdir -p {self.args.debug_dir}/track_vis2 {self.args.debug_dir}/ob_in_cam')

    def _init_estimator(self):
        logging.info("estimator initialization done")
        return FoundationPose(
            model_pts=self.mesh.vertices,
            model_normals=self.mesh.vertex_normals,
            mesh=self.mesh,
            scorer=self.scorer,
            refiner=self.refiner,
            debug_dir=self.args.debug_dir,
            debug=self.args.debug,
            glctx=self.glctx
        )

    def get_poll2(self, pose):
        if pose[0][1] > 0:
            T1 = np.array([[1, 0, 0, 0],
                    [0, 1, 0, 0],
                    [0, 0, 1, 0],
                    [0, 0, 0, 1]])
        else:
            T1 = np.array([[1, 0, 0, 0],
                    [0, -1, 0, 0],
                    [0, 0, -1, 0],
                    [0, 0, 0, 1]])
        pose2 = np.dot(pose,T1)
        return pose2
    
    def matrix_to_pose2(self, matrix):
        pose = np.zeros(6)
        pose[:3] = matrix[:3, 3]
        r = R.from_matrix(matrix[:3, :3])
        pose[3:] = r.as_euler('xyz')
        return pose
    # def get_poll2(self, pose):
    #     rotation_matrix = pose[:3, :3]
    #     distancce2 = np.array([0, -0.0005, 0.0045])
    #     rot = R.from_matrix(rotation_matrix)
    #     rx, ry, rz = rot.as_euler('xyz')
    #     if 1 > rx > -1:
    #         T1 = np.array([[1, 0, 0],
    #                        [0, -1, 0],
    #                        [0, 0, -1]])
    #         rotation_matrix = np.dot(rotation_matrix, T1)
    #         rot = R.from_matrix(rotation_matrix)
    #         rx, ry, rz = rot.as_euler('xyz')
    #         print(rx, ry, rz)
    #     delta_camera2 = np.dot(rotation_matrix, distancce2)
    #     return rx, ry, rz, delta_camera2

    def process_frame(self, color_image, depth_image):
        try:
            depth_meters = depth_image.astype(np.float32) / 1000.0
            processed_depth = cv2.resize(depth_meters, (640, 480), interpolation=cv2.INTER_NEAREST)
            mask = get_two_box_mask(color_image, self.i)
            if mask is None:
                obj_pose = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]  # 自定义默认值
                return obj_pose
            else:
                pose = self.est.register(
                    K=self.reader.K,
                    rgb=color_image,
                    depth=processed_depth,
                    ob_mask=mask,
                    iteration=self.args.est_refine_iter
                )
                center_pose = pose @ np.linalg.inv(self.to_origin)
                vis = draw_posed_3d_box(self.reader.K, img=color_image, ob_in_cam=center_pose, bbox=self.bbox)
                vis = draw_xyz_axis(
                    color_image,
                    ob_in_cam=center_pose,
                    scale=0.1,
                    K=self.reader.K,
                    thickness=3,
                    transparency=0,
                    is_input_rgb=True
                )

                obj_pose = [-0.015, 0.008, 0.3, np.pi , np.pi*0.23, -np.pi / 2]
                matrixcam = np.array([[0.02016184, 0.83121816, 0.55558067, 0.09366171],
                            [0.0124392, -0.55585916, 0.83118341, 0.16732347],
                            [0.99971934, -0.0098472, -0.02154684, -0.14048997],
                            [0, 0, 0, 1]])
                toolpose1 = self.get_poll2(pose)
                toolpose2 = matrixcam @ toolpose1
                obj_pose = self.matrix_to_pose2(toolpose2)
                print(pose)
                print(obj_pose)
                cv2.imshow('1', vis[..., ::-1])
                cv2.waitKey(1)  # 等待按键
                os.makedirs(f'{self.args.debug_dir}/track_vis2', exist_ok=True)
                imageio.imwrite(f'{self.args.debug_dir}/track_vis2/{self.i}.png', vis)
                self.i += 1
                return obj_pose
        except KeyboardInterrupt:
            print("Keyboard interrupt received")
            return None

    def run(self, color_image, depth_image):
        # 调用process_frame并返回结果
        return self.process_frame(color_image, depth_image)


if __name__ == '__main__':
    estimator = PoseEstimator()
    result_pose = estimator.run()
    # 在这里可以使用输出的obj_pose进行后续处理
    if result_pose is not None:
        print("最终输出的obj_pose:", result_pose)
    result_pose2 = estimator.run()
    # 在这里可以使用输出的obj_pose进行后续处理
    if result_pose is not None:
        print("最终输出的obj_pose:", result_pose2)