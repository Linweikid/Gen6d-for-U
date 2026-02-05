# Install script for directory: /media/zxr/WYM/rm65_assembly/perception_ws/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/media/zxr/WYM/rm65_assembly/perception_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/media/zxr/WYM/rm65_assembly/perception_ws/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/media/zxr/WYM/rm65_assembly/perception_ws/install" TYPE PROGRAM FILES "/media/zxr/WYM/rm65_assembly/perception_ws/build/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/media/zxr/WYM/rm65_assembly/perception_ws/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/media/zxr/WYM/rm65_assembly/perception_ws/install" TYPE PROGRAM FILES "/media/zxr/WYM/rm65_assembly/perception_ws/build/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/media/zxr/WYM/rm65_assembly/perception_ws/install/setup.bash;/media/zxr/WYM/rm65_assembly/perception_ws/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/media/zxr/WYM/rm65_assembly/perception_ws/install" TYPE FILE FILES
    "/media/zxr/WYM/rm65_assembly/perception_ws/build/catkin_generated/installspace/setup.bash"
    "/media/zxr/WYM/rm65_assembly/perception_ws/build/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/media/zxr/WYM/rm65_assembly/perception_ws/install/setup.sh;/media/zxr/WYM/rm65_assembly/perception_ws/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/media/zxr/WYM/rm65_assembly/perception_ws/install" TYPE FILE FILES
    "/media/zxr/WYM/rm65_assembly/perception_ws/build/catkin_generated/installspace/setup.sh"
    "/media/zxr/WYM/rm65_assembly/perception_ws/build/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/media/zxr/WYM/rm65_assembly/perception_ws/install/setup.zsh;/media/zxr/WYM/rm65_assembly/perception_ws/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/media/zxr/WYM/rm65_assembly/perception_ws/install" TYPE FILE FILES
    "/media/zxr/WYM/rm65_assembly/perception_ws/build/catkin_generated/installspace/setup.zsh"
    "/media/zxr/WYM/rm65_assembly/perception_ws/build/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/media/zxr/WYM/rm65_assembly/perception_ws/install/setup.fish;/media/zxr/WYM/rm65_assembly/perception_ws/install/local_setup.fish")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/media/zxr/WYM/rm65_assembly/perception_ws/install" TYPE FILE FILES
    "/media/zxr/WYM/rm65_assembly/perception_ws/build/catkin_generated/installspace/setup.fish"
    "/media/zxr/WYM/rm65_assembly/perception_ws/build/catkin_generated/installspace/local_setup.fish"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/media/zxr/WYM/rm65_assembly/perception_ws/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/media/zxr/WYM/rm65_assembly/perception_ws/install" TYPE FILE FILES "/media/zxr/WYM/rm65_assembly/perception_ws/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/gtest/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_moveit_config/rm_65_6f_moveit_config/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_moveit_config/rm_65_moveit_config/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_moveit_config/rm_75_6f_moveit_config/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_moveit_config/rm_75_moveit_config/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_bringup/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_moveit_config/rm_eco63_moveit_config/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_moveit_config/rm_eco65_6f_moveit_config/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_moveit_config/rm_eco65_moveit_config/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_moveit_config/rm_gen72_moveit_config/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_moveit_config/rml_63_6f_moveit_config/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_moveit_config/rml_63_moveit_config/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/realsense-ros/realsense2_description/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/pose_estimation_pkg/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_doc/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_msgs/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_arm_examples/control_arm_move/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_arm_examples/force_position_control/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_arm_examples/get_arm_state/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_driver/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_control/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/realsense-ros/realsense2_camera/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_gazebo/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/dual_arm_robot_fixed/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_description/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/urdf_left_with_force_sensor/cmake_install.cmake")
  include("/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/urdf_right_with_force_sensor/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/media/zxr/WYM/rm65_assembly/perception_ws/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
