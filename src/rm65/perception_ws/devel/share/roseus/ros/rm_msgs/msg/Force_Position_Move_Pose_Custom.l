;; Auto-generated. Do not edit!


(when (boundp 'rm_msgs::Force_Position_Move_Pose_Custom)
  (if (not (find-package "RM_MSGS"))
    (make-package "RM_MSGS"))
  (shadow 'Force_Position_Move_Pose_Custom (find-package "RM_MSGS")))
(unless (find-package "RM_MSGS::FORCE_POSITION_MOVE_POSE_CUSTOM")
  (make-package "RM_MSGS::FORCE_POSITION_MOVE_POSE_CUSTOM"))

(in-package "ROS")
;;//! \htmlinclude Force_Position_Move_Pose_Custom.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass rm_msgs::Force_Position_Move_Pose_Custom
  :super ros::object
  :slots (_Pose _sensor _mode _dir _force _follow _trajectory_mode _radio ))

(defmethod rm_msgs::Force_Position_Move_Pose_Custom
  (:init
   (&key
    ((:Pose __Pose) (instance geometry_msgs::Pose :init))
    ((:sensor __sensor) 0)
    ((:mode __mode) 0)
    ((:dir __dir) 0)
    ((:force __force) 0)
    ((:follow __follow) nil)
    ((:trajectory_mode __trajectory_mode) 0)
    ((:radio __radio) 0)
    )
   (send-super :init)
   (setq _Pose __Pose)
   (setq _sensor (round __sensor))
   (setq _mode (round __mode))
   (setq _dir (round __dir))
   (setq _force (round __force))
   (setq _follow __follow)
   (setq _trajectory_mode (round __trajectory_mode))
   (setq _radio (round __radio))
   self)
  (:Pose
   (&rest __Pose)
   (if (keywordp (car __Pose))
       (send* _Pose __Pose)
     (progn
       (if __Pose (setq _Pose (car __Pose)))
       _Pose)))
  (:sensor
   (&optional __sensor)
   (if __sensor (setq _sensor __sensor)) _sensor)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:dir
   (&optional __dir)
   (if __dir (setq _dir __dir)) _dir)
  (:force
   (&optional __force)
   (if __force (setq _force __force)) _force)
  (:follow
   (&optional (__follow :null))
   (if (not (eq __follow :null)) (setq _follow __follow)) _follow)
  (:trajectory_mode
   (&optional __trajectory_mode)
   (if __trajectory_mode (setq _trajectory_mode __trajectory_mode)) _trajectory_mode)
  (:radio
   (&optional __radio)
   (if __radio (setq _radio __radio)) _radio)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _Pose
    (send _Pose :serialization-length)
    ;; uint8 _sensor
    1
    ;; uint8 _mode
    1
    ;; uint8 _dir
    1
    ;; int16 _force
    2
    ;; bool _follow
    1
    ;; uint8 _trajectory_mode
    1
    ;; uint8 _radio
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _Pose
       (send _Pose :serialize s)
     ;; uint8 _sensor
       (write-byte _sensor s)
     ;; uint8 _mode
       (write-byte _mode s)
     ;; uint8 _dir
       (write-byte _dir s)
     ;; int16 _force
       (write-word _force s)
     ;; bool _follow
       (if _follow (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _trajectory_mode
       (write-byte _trajectory_mode s)
     ;; uint8 _radio
       (write-byte _radio s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _Pose
     (send _Pose :deserialize buf ptr-) (incf ptr- (send _Pose :serialization-length))
   ;; uint8 _sensor
     (setq _sensor (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _mode
     (setq _mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _dir
     (setq _dir (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int16 _force
     (setq _force (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; bool _follow
     (setq _follow (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _trajectory_mode
     (setq _trajectory_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _radio
     (setq _radio (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get rm_msgs::Force_Position_Move_Pose_Custom :md5sum-) "ba22909657b007c304f2b2ecbe12b041")
(setf (get rm_msgs::Force_Position_Move_Pose_Custom :datatype-) "rm_msgs/Force_Position_Move_Pose_Custom")
(setf (get rm_msgs::Force_Position_Move_Pose_Custom :definition-)
      "geometry_msgs/Pose Pose
uint8 sensor
uint8 mode
uint8 dir
int16 force
bool follow
uint8 trajectory_mode
uint8 radio

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :rm_msgs/Force_Position_Move_Pose_Custom "ba22909657b007c304f2b2ecbe12b041")


