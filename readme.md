# 本功能包用于估计U型管与铜管孔的位姿
使用本功能包需要开启三个终端，终端启动目录在catkin_ws文件夹下  
每一个终端打开后按以下三个顺序进行  
## 第一步：打开ros核心
```markdown
### 1. 刷新环境变量
source /opt/ros/noetic/setup.bash
### 2.启动ros核心
roscore
```
结束后正常会显示：
```markdown
started core service [/rosout]
```

## 第二步：开启相机节点
```markdown
### 1. 刷新环境变量
source /opt/ros/noetic/setup.bash
source devel/setup.bash
### 2.启动相机节点，该节点作用为开启相机并发布图像话题
roslaunch realsense_pkg realsense.launch
```
这一步结束后可以开启另一个终端输入进行检查：
```markdown
rostopic list
```
若正常应该会有/camera1和/camera2下的一系列话题  

## 第三步：进行位姿估计
```markdown
### 1. 进入虚拟环境
conda activate rm65_assembly
### 2. 刷新环境变量
source /opt/ros/noetic/setup.bash
source devel/setup.bash
### 3.开启相机1估计程序节点
rosrun pose_estimation_pkg pose_estimation_phb.py
### 4.新开终端，重复12步骤后开启相机2估计程序节点
rosrun pose_estimation_pkg pose22.py
```
相机1节点订阅的相机话题为（相机2同理）：
```markdown
color_topic = "/camera1/color/image_raw"
depth_topic = "/camera1/aligned_depth_to_color/image_raw"  
```
输出的话题为1*6以[x y z rx ry rz]构型的数组：  
"/target_u_pose"和"/target_h_pose"  
"/target_u_pose2"和"/target_h_pose2"  
同样可以新开启终端检查是否正常输出两个话题：
```markdown
rostopic list
### 检测话题数据
rostopic echo /target_u_pose
```