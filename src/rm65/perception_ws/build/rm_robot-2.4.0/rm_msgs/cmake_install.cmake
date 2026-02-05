# Install script for directory: /media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rm_msgs/msg" TYPE FILE FILES
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Arm_Analog_Output.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Arm_Digital_Output.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Arm_Joint_Speed_Max.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Arm_Software_Version.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Arm_IO_State.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/JointPos.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/MoveC.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/MoveJ.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/MoveJ_P.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/MoveL.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Tool_Analog_Output.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Tool_Digital_Output.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Tool_IO_State.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Plan_State.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Cabinet.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/ChangeTool_State.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/ChangeTool_Name.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/ChangeWorkFrame_State.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/ChangeWorkFrame_Name.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Arm_Current_State.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/GetArmState_Command.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Stop.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Joint_Teach.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Pos_Teach.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Ort_Teach.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Stop_Teach.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Gripper_Set.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Gripper_Pick.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Joint_Enable.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Joint_Max_Speed.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/IO_Update.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Turtle_Driver.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Socket_Command.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Start_Multi_Drag_Teach.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Set_Force_Position.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Force_Position_Move_Joint.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Force_Position_Move_Pose.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Force_Position_State.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Six_Force.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Manual_Set_Force_Pose.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/CartePos.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Lift_Height.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Lift_Speed.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Joint_Current.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Joint_Step.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/ArmState.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Hand_Posture.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Hand_Seq.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Hand_Speed.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Hand_Force.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Hand_Angle.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Hand_Status.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/LiftState.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Servo_GetAngle.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Servo_Move.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Set_Realtime_Push.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Arm_Current_Status.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Joint_En_Flag.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Joint_PoseEuler.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Joint_Speed.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Joint_Temperature.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Joint_Voltage.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Lift_In_Position.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/CartePosCustom.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/JointPosCustom.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Force_Position_Move_Pose_Custom.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/RS485_Mode.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Set_Modbus_Mode.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Register_Data.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Read_Register.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Err.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Rm_Plus_Base.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Rm_Plus_State.msg"
    "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/msg/Write_Register.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rm_msgs/cmake" TYPE FILE FILES "/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_msgs/catkin_generated/installspace/rm_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/media/zxr/WYM/rm65_assembly/perception_ws/devel/include/rm_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/media/zxr/WYM/rm65_assembly/perception_ws/devel/share/roseus/ros/rm_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/media/zxr/WYM/rm65_assembly/perception_ws/devel/share/common-lisp/ros/rm_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/media/zxr/WYM/rm65_assembly/perception_ws/devel/share/gennodejs/ros/rm_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/media/zxr/WYM/rm65_assembly/perception_ws/devel/lib/python3/dist-packages/rm_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/media/zxr/WYM/rm65_assembly/perception_ws/devel/lib/python3/dist-packages/rm_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_msgs/catkin_generated/installspace/rm_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rm_msgs/cmake" TYPE FILE FILES "/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_msgs/catkin_generated/installspace/rm_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rm_msgs/cmake" TYPE FILE FILES
    "/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_msgs/catkin_generated/installspace/rm_msgsConfig.cmake"
    "/media/zxr/WYM/rm65_assembly/perception_ws/build/rm_robot-2.4.0/rm_msgs/catkin_generated/installspace/rm_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rm_msgs" TYPE FILE FILES "/media/zxr/WYM/rm65_assembly/perception_ws/src/rm_robot-2.4.0/rm_msgs/package.xml")
endif()

