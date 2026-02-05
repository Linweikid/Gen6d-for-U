import pyrealsense2 as rs
import numpy as np
import cv2


class RealSenseSingleFrameCapture:
    def __init__(self):
        """初始化相机并配置参数"""
        self.pipeline = rs.pipeline()
        self.config = rs.config()
        self.config1.enable_device(cam1_id)
        # 配置相机流（640x480分辨率）
        self.config.enable_stream(rs.stream.color, 640, 480, rs.format.bgr8, 30)
        self.config.enable_stream(rs.stream.depth, 640, 480, rs.format.z16, 30)

        # 创建对齐对象，将深度帧对齐到RGB帧
        self.align_to = rs.stream.color
        self.align = rs.align(self.align_to)

        # 计算截取区域（以底边为基准，水平居中）
        # self.crop_width = 640
        # self.crop_height = 480
        # self.crop_x = (1280 - self.crop_width) // 2  # 320
        # self.crop_y = 720 - self.crop_height  # 240

    def get_single_frame(self):
        """获取单帧图像并返回截取后的彩色和深度图像"""
        try:
            # 启动相机
            self.pipeline.start(self.config)

            print("相机已启动，正在预热...")

            # 等待1秒让相机稳定（约30帧）
            for _ in range(5):
                self.pipeline.wait_for_frames()

            # 捕获一帧数据
            frames = self.pipeline.wait_for_frames()
            aligned_frames = self.align.process(frames)

            depth_frame = aligned_frames.get_depth_frame()
            color_frame = aligned_frames.get_color_frame()

            if not depth_frame or not color_frame:
                raise RuntimeError("无法获取有效的深度或彩色帧")

            # 将图像转换为numpy数组
            depth_image = np.asanyarray(depth_frame.get_data())
            color_image = np.asanyarray(color_frame.get_data())

            # 截取子区域
            # color_cropped = color_image[self.crop_y:self.crop_y + self.crop_height,
            #                 self.crop_x:self.crop_x + self.crop_width]
            # depth_cropped = depth_image[self.crop_y:self.crop_y + self.crop_height,
            #                 self.crop_x:self.crop_x + self.crop_width]

            return {
                'color_image': color_image,
                'depth_image': depth_image,
            }

        finally:
            # 停止相机
            if hasattr(self, 'pipeline') and self.pipeline:
                self.pipeline.stop()


# 使用示例
if __name__ == "__main__":
    # 创建捕获对象
    capture = RealSenseSingleFrameCapture()

    # 获取单帧数据
    frame_data = capture.get_single_frame()

    # 提取数据
    color_image = frame_data['color_image']
    depth_image = frame_data['depth_image']

    # 显示截取后的图像
    cv2.namedWindow('彩色图像 (截取后)', cv2.WINDOW_NORMAL)
    cv2.resizeWindow('彩色图像 (截取后)', 640, 480)
    cv2.imshow('彩色图像 (截取后)', color_image)

    # 显示深度图像（应用颜色映射）
    depth_8bit = cv2.convertScaleAbs(depth_image, alpha=0.03)
    depth_colormap = cv2.applyColorMap(depth_8bit, cv2.COLORMAP_JET)
    cv2.namedWindow('深度图像 (截取后)', cv2.WINDOW_NORMAL)
    cv2.resizeWindow('深度图像 (截取后)', 640, 480)
    cv2.imshow('深度图像 (截取后)', depth_colormap)

    # 按任意键退出
    cv2.waitKey(0)
    cv2.destroyAllWindows()