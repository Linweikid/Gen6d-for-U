# 1. 最低CMake版本（ROS Noetic要求3.0.2+）
cmake_minimum_required(VERSION 3.0.2)

# 2. 项目名（必须和包名一致）
project(realsense_pkg)

# 3. 启用Python3（ROS Noetic默认Python3，Melodic需改为Python2）
set(PYTHON_EXECUTABLE /usr/bin/python3)
set(PYTHON_INCLUDE_DIR /usr/include/python3.8)  # 替换为你的Python版本（如3.6/3.9）

# 4. 查找ROS依赖
find_package(catkin REQUIRED COMPONENTS
  rospy
  sensor_msgs
  cv_bridge
  message_filters
)

# 5. 声明catkin包（核心）
catkin_package(
  CATKIN_DEPENDS rospy sensor_msgs cv_bridge message_filters
)

# 6. 包含头文件目录（无需修改）
include_directories(
  ${catkin_INCLUDE_DIRS}
)

# 7. 安装Python节点（关键：让rosrun能找到你的.py文件）
catkin_install_python(PROGRAMS
  src/realsense_reader.py  # 你的核心节点文件路径
  # 若有其他节点（如detect_node.py），继续添加
  # src/detect_node.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)