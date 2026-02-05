import pyrealsense2 as rs
import numpy as np
import cv2


class RealSenseDualCapture:
    def __init__(self, cam1_id="234322307736", cam2_id="233522079509"):
        """初始化两个相机并配置参数"""
        # 相机1配置
        self.pipeline1 = rs.pipeline()
        self.config1 = rs.config()
        self.config1.enable_device(cam1_id)
        self.config1.enable_stream(rs.stream.color, 640, 480, rs.format.bgr8, 30)
        self.config1.enable_stream(rs.stream.depth, 640, 480, rs.format.z16, 30)

        # 相机2配置
        self.pipeline2 = rs.pipeline()
        self.config2 = rs.config()
        self.config2.enable_device(cam2_id)
        self.config2.enable_stream(rs.stream.color, 640, 480, rs.format.bgr8, 30)
        self.config2.enable_stream(rs.stream.depth, 640, 480, rs.format.z16, 30)

        # 创建对齐对象，将深度帧对齐到RGB帧
        self.align_to = rs.stream.color
        self.align = rs.align(self.align_to)

    def _get_frame_from_pipeline(self, pipeline, config):
        """内部通用方法：从指定管道获取单帧图像"""
        try:
            # 启动相机管道
            pipeline.start(config)
            pipeline.wait_for_frames()
            # 获取对齐后的帧
            frames = pipeline.wait_for_frames()
            aligned_frames = self.align.process(frames)

            depth_frame = aligned_frames.get_depth_frame()
            color_frame = aligned_frames.get_color_frame()

            if not depth_frame or not color_frame:
                raise RuntimeError("无法获取有效的深度或彩色帧")

            # 转换为numpy数组
            depth_image = np.asanyarray(depth_frame.get_data())
            color_image = np.asanyarray(color_frame.get_data())
            
            # profile = pipeline.start(config)
            # color_profile = profile.get_stream(rs.stream.color)
            # color_intrinsicx = color_profile.as_video_stream_profile().get_intrinsics()
            
            return {
                'color_image': color_image,
                'depth_image': depth_image,
            }
            # print(color_intrinsicx.ppx , color_intrinsicx.ppy ,color_intrinsicx.fx, color_intrinsicx.fy)
            # return color_intrinsicx
        finally:
            # 确保相机停止
            pipeline.stop()

    def get_cam1_frame(self):
        """获取相机1（ID:123456789）的彩色和深度图像"""
        print("正在获取相机1图像...")
        return self._get_frame_from_pipeline(self.pipeline1, self.config1)

    def get_cam2_frame(self):
        """获取相机2（ID:987654321）的彩色和深度图像"""
        print("正在获取相机2图像...")
        return self._get_frame_from_pipeline(self.pipeline2, self.config2)


# 使用示例
if __name__ == "__main__":
    # 创建双相机捕获对象
    dual_capture = RealSenseDualCapture()

    # 获取相机1图像
    cam1_data = dual_capture.get_cam2_frame()
    # cam1_color = cam1_data['color_image']
    # cam1_depth = cam1_data['depth_image']

    # # 获取相机2图像
    # cam2_data = dual_capture.get_cam2_frame()
    # cam2_color = cam2_data['color_image']
    # cam2_depth = cam2_data['depth_image']

    # # 显示相机1图像
    # cv2.namedWindow('相机1 - 彩色图像', cv2.WINDOW_NORMAL)
    # cv2.resizeWindow('相机1 - 彩色图像', 640, 480)
    # cv2.imshow('相机1 - 彩色图像', cam1_color)

    # # 显示相机1深度图
    # cam1_depth_8bit = cv2.convertScaleAbs(cam1_depth, alpha=0.03)
    # cam1_depth_colormap = cv2.applyColorMap(cam1_depth_8bit, cv2.COLORMAP_JET)
    # cv2.namedWindow('相机1 - 深度图像', cv2.WINDOW_NORMAL)
    # cv2.resizeWindow('相机1 - 深度图像', 640, 480)
    # cv2.imshow('相机1 - 深度图像', cam1_depth_colormap)

    # # 显示相机2图像
    # cv2.namedWindow('相机2 - 彩色图像', cv2.WINDOW_NORMAL)
    # cv2.resizeWindow('相机2 - 彩色图像', 640, 480)
    # cv2.imshow('相机2 - 彩色图像', cam2_color)

    # # 显示相机2深度图
    # cam2_depth_8bit = cv2.convertScaleAbs(cam2_depth, alpha=0.03)
    # cam2_depth_colormap = cv2.applyColorMap(cam2_depth_8bit, cv2.COLORMAP_JET)
    # cv2.namedWindow('相机2 - 深度图像', cv2.WINDOW_NORMAL)
    # cv2.resizeWindow('相机2 - 深度图像', 640, 480)
    # cv2.imshow('相机2 - 深度图像', cam2_depth_colormap)

    # # 按任意键退出
    # cv2.waitKey(0)
    # cv2.destroyAllWindows()