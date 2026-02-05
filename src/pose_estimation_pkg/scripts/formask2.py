from ultralytics import YOLO
import numpy as np
import cv2
import os
from get_png import RealSenseSingleFrameCapture
def get_box_binary_mask1(image, i):
    model_path = "/media/jt/73B26804703F8EDC/mymodel/detect/trainU/weights/best.pt"
    # model_path = "/home/jt/disk/catkin_ws/src/pose_estimation_pkg/scripts/runs/detect/train/weights/best.pt"
    model = YOLO(model_path)
    results = model(image, imgsz=640, conf=0.65)  # conf为置信度阈值，可调整
    
    # 获取原图尺寸，创建空白二值化画布（初始全黑）
    h, w = image.shape[:2]
    binary_mask = np.zeros((h, w), dtype=np.uint8)  # 0表示黑色
    
    # 遍历所有检测到的框
    if results and len(results[0].boxes) > 0:
        for box in results[0].boxes:
            # 提取框的坐标（左上角x1, y1，右下角x2, y2），转为整数
            x1, y1, x2, y2 = map(int, box.xyxy[0].cpu().numpy())  # xyxy格式：左上角和右下角坐标
            # 确保坐标在图像范围内（防止越界）
            x1 = max(0, x1)
            y1 = max(0, y1)
            x2 = min(w, x2)
            y2 = min(h, y2)
            # 在二值化掩码中，将框内区域设为白色（255）
            binary_mask[y1:y2, x1:x2] = 255  # 行范围[y1:y2]，列范围[x1:x2]
        cv2.namedWindow("result", cv2.WINDOW_NORMAL)
        cv2.resizeWindow("result", 640, 480)
        cv2.imshow('result', binary_mask)
        binary_mask = cv2.resize(binary_mask, (640,480), interpolation=cv2.INTER_NEAREST).astype(bool).astype(np.uint8)
        binary_mask = binary_mask.astype(bool)
        return binary_mask
    else:
        x1 = 225
        y1 = 176
        x2 = 299
        y2 = 268
        # 在二值化掩码中，将框内区域设为白色（255）
        binary_mask[y1:y2, x1:x2] = 255  # 行范围[y1:y2]，列范围[x1:x2]
        cv2.namedWindow("result", cv2.WINDOW_NORMAL)
        cv2.resizeWindow("result", 640, 480)
        cv2.imshow('result', binary_mask)
        binary_mask = cv2.resize(binary_mask, (640,480), interpolation=cv2.INTER_NEAREST).astype(bool).astype(np.uint8)
        binary_mask = binary_mask.astype(bool)
        return binary_mask
    
def get_box_binary_mask2(image, i):
    model_path = "/media/jt/73B26804703F8EDC/mymodel/detect/trainto/weights/best.pt"
    # model_path = "/media/jt/73B26804703F8EDC/rm-pose/FoundationPose1/runs/detect/train7/weights/best.pt"
    model = YOLO(model_path)
    results = model(image, imgsz=640, conf=0.05)  # conf为置信度阈值，可调整 
    found_class_0 = False
    # 获取原图尺寸，创建空白二值化画布（初始全黑）
    h, w = image.shape[:2]
    binary_mask = np.zeros((h, w), dtype=np.uint8)  # 0表示黑色
    
    # 遍历所有检测到的框
    if results and len(results[0].boxes) > 0:
        for box in results[0].boxes:
            # 核心修改：获取并判断类别ID
            cls_id = int(box.cls.cpu().numpy())
            
            # 仅当类别ID为0时，才执行后续操作
            if cls_id == 0:
                # 提取框的坐标（左上角x1, y1，右下角x2, y2），转为整数
                x1, y1, x2, y2 = map(int, box.xyxy[0].cpu().numpy())
                found_class_0 = True
                # 确保坐标在图像范围内（防止越界）
                x1 = max(0, x1)
                y1 = max(0, y1)
                x2 = min(w, x2)
                y2 = min(h, y2)
                
                # 在二值化掩码中，将框内区域设为白色（255）
                binary_mask[y1:y2, x1:x2] = 255
                cv2.namedWindow("result", cv2.WINDOW_NORMAL)
                cv2.resizeWindow("result", 640, 480)
                cv2.imshow('result', binary_mask)
        if found_class_0:
            # 如果找到了类别0的物体，则处理并返回掩码
            binary_mask = cv2.resize(binary_mask, (640, 480), interpolation=cv2.INTER_NEAREST).astype(bool).astype(np.uint8)
            binary_mask = binary_mask.astype(bool)
            print("000000000")
            return binary_mask 
        else:
            # 如果遍历了所有框，但一个类别0的物体都没有找到，返回None
            return None
    else:
        return None

def get_two_box_mask(image, i):
    model_path = "/home/jt/disk/catkin_ws/src/pose_estimation_pkg/scripts/runs/detect/train7/weights/best.pt"
    model = YOLO(model_path)
    results = model(image, imgsz=640, conf=0.6)  # conf为置信度阈值，可调整
    # 获取原图尺寸，创建空白二值化画布（初始全黑）
    h, w = image.shape[:2]
    binary_mask = np.zeros((h, w), dtype=np.uint8)  # 0表示黑色
    
    if results and len(results[0].boxes) >= 2:
        boxes = results[0].boxes
        box_list = []
        for idx, box in enumerate(boxes):
            x1, y1, x2, y2 = map(int, box.xyxy[0].cpu().numpy())
            box_list.append((x1, y1, x2, y2 ,idx))
        box_list.sort(key=lambda x:x[0])
        first_box = box_list[0]
        second_box = box_list[1]
        print (first_box,second_box)
        x1, y1 = first_box[0], first_box[1]
        x2, y2 = second_box[2], second_box[3]
        binary_mask[y1:y2, x1:x2] = 255
        binary_mask = cv2.resize(binary_mask, (640,480), interpolation=cv2.INTER_NEAREST).astype(bool).astype(np.uint8)
        binary_mask = binary_mask.astype(bool)
        return binary_mask
    else:
        print("000000000")
        binary_mask = None
    # cv2.namedWindow("result", cv2.WINDOW_NORMAL)
    # cv2.resizeWindow("result", 640, 480)
    # cv2.imshow('result', binary_mask)
    # save_path = f'{i}.png'
    # cv2.imwrite(save_path, binary_mask)

def get_two_box_mask2(image, i):
    # model_path = "/media/jt/73B26804703F8EDC/rm-pose/FoundationPose1/runs/detect/train7/weights/best.pt"
    model_path = "/media/jt/73B26804703F8EDC/rm-pose/runs/detect/xiongqianU2/weights/best.pt"
    model = YOLO(model_path)
    results = model(image, imgsz=640, conf=0.6)  # conf为置信度阈值，可调整
    
    # 获取原图尺寸，创建空白二值化画布（初始全黑）
    h, w = image.shape[:2]
    binary_mask = np.zeros((h, w), dtype=np.uint8)  # 0表示黑色
    
    # 检查是否有检测结果
    if results and len(results[0].boxes) > 0:
        box_list = []
        for idx, box in enumerate(results[0].boxes):
            cls_id = int(box.cls.cpu().numpy())
            if cls_id == 1:
                x1, y1, x2, y2 = map(int, box.xyxy[0].cpu().numpy())
                # 现在 idx 是已定义的，可以安全使用
                box_list.append((x1, y1, x2, y2, idx))
        class1_count = len(box_list)
        # 核心修改2：输出类别1的识别个数
        print(f"【图像{i}】类别1的识别个数：{class1_count}")
        if len(box_list) >= 2:
            box_list.sort(key=lambda x: x[0])
            first_box = box_list[0]
            second_box = box_list[1]
            
            merge_x1 = min(first_box[0], second_box[0])
            merge_y1 = min(first_box[1], second_box[1])
            merge_x2 = max(first_box[2], second_box[2])
            merge_y2 = max(first_box[3], second_box[3])
            
            # 在二值化掩码中，将合并区域设为白色（255）
            binary_mask[merge_y1:merge_y2, merge_x1:merge_x2] = 255
            cv2.namedWindow("result", cv2.WINDOW_NORMAL)
            cv2.resizeWindow("result", 800, 600)
            cv2.imshow('result', binary_mask)
            # 优化：移除了冗余的 .astype(bool)
            binary_mask = cv2.resize(binary_mask, (640, 480), interpolation=cv2.INTER_NEAREST).astype(bool).astype(np.uint8)
            return binary_mask
        else:
            # 如果找到的类别1的框少于2个，返回None
            print(f"只找到了 {len(box_list)} 个类别为1的物体，无法合并。")
            return None
    else:
        # 如果一张图上一个框都没有检测到，返回None
        return None


if __name__ == '__main__':
    # 模型路径（使用目标检测模型，如yolov8n.pt，而非-seg分割模型）
    model_path = "/media/jt/73B26804703F8EDC/rm-pose/FoundationPose1/runs/detect/train7/weights"  # 替换为你的检测模型路径
    # 测试图像路径
    img_paths = [
        "/media/jt/73B26804703F8EDC/rm-pose/FoundationPose1/yolo-seg/ultralytics/peida/dataset_20250728_111724_yolo/dataset/images/pei1.jpg",
        "/media/jt/73B26804703F8EDC/rm-pose/FoundationPose1/yolo-seg/ultralytics/peida/dataset_20250728_111724_yolo/dataset/images/pei5.jpg"
    ]
    
    # 验证路径有效性
    assert os.path.exists(model_path), f"模型文件不存在：{model_path}"
    for path in img_paths:
        assert os.path.exists(path), f"图像文件不存在：{path}"
    
    # 加载YOLO目标检测模型（确保是检测模型，而非分割模型）
    model = YOLO(model_path)  # 若使用官方模型，可直接写"yolov8n.pt"自动下载
    
    # 处理每张图像
    for i, img_path in enumerate(img_paths):
        # 读取图像
        image = cv2.imread(img_path)
        if image is None:
            print(f"无法读取图像：{img_path}")
            continue
        
        # 获取二值化掩码（框内白色，框外黑色）
        binary_mask = get_two_box_mask(image, i)
        
        # 显示结果
        cv2.namedWindow(f"mask_{i+1}", cv2.WINDOW_NORMAL)
        cv2.resizeWindow(f"mask_{i+1}", 800, 600)
        cv2.imshow(f"mask_{i+1}", image)
        cv2.namedWindow(f"binary_mask_{i+1}", cv2.WINDOW_NORMAL)
        cv2.resizeWindow(f"binary_mask_{i+1}", 800, 600)
        cv2.imshow(f"binary_mask_{i+1}", binary_mask)
    
    cv2.waitKey(0)
    cv2.destroyAllWindows()
