# Install script for directory: /media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/urdf_left_with_force_sensor

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/urdf_left_with_force_sensor/catkin_generated/installspace/urdf_left_with_force_sensor.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/urdf_left_with_force_sensor/cmake" TYPE FILE FILES
    "/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/urdf_left_with_force_sensor/catkin_generated/installspace/urdf_left_with_force_sensorConfig.cmake"
    "/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/urdf_left_with_force_sensor/catkin_generated/installspace/urdf_left_with_force_sensorConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/urdf_left_with_force_sensor" TYPE FILE FILES "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/urdf_left_with_force_sensor/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/urdf_left_with_force_sensor/config" TYPE DIRECTORY FILES "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/urdf_left_with_force_sensor/config/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/urdf_left_with_force_sensor/launch" TYPE DIRECTORY FILES "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/urdf_left_with_force_sensor/launch/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/urdf_left_with_force_sensor/meshes" TYPE DIRECTORY FILES "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/urdf_left_with_force_sensor/meshes/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/urdf_left_with_force_sensor/urdf" TYPE DIRECTORY FILES "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/urdf_left_with_force_sensor/urdf/")
endif()

