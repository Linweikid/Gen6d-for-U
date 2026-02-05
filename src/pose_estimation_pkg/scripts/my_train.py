from ultralytics import YOLO

# Load a model
model = YOLO("/media/jt/73B26804703F8EDC/rm-pose/FoundationPose1/runs/detect/train6/weights/best.pt")
#model = YOLO("/media/jt/73B26804703F8EDC/rm-pose/FoundationPose1/yolo-seg/yolov8s.pt")
# model = YOLO("yolo11n-seg.yaml").load("yolo11n.pt")  # build from YAML and transfer weights

# Train the model
results = model.train(data="/media/jt/73B26804703F8EDC/rm-pose/FoundationPose1/yolo-seg/ultralytics/cfg/datasets/coco128-seg.yaml", epochs=20, imgsz=640)
