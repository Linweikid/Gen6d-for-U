;; Auto-generated. Do not edit!


(when (boundp 'rm_msgs::CartePosCustom)
  (if (not (find-package "RM_MSGS"))
    (make-package "RM_MSGS"))
  (shadow 'CartePosCustom (find-package "RM_MSGS")))
(unless (find-package "RM_MSGS::CARTEPOSCUSTOM")
  (make-package "RM_MSGS::CARTEPOSCUSTOM"))

(in-package "ROS")
;;//! \htmlinclude CartePosCustom.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass rm_msgs::CartePosCustom
  :super ros::object
  :slots (_Pose _follow _trajectory_mode _radio ))

(defmethod rm_msgs::CartePosCustom
  (:init
   (&key
    ((:Pose __Pose) (instance geometry_msgs::Pose :init))
    ((:follow __follow) nil)
    ((:trajectory_mode __trajectory_mode) 0)
    ((:radio __radio) 0)
    )
   (send-super :init)
   (setq _Pose __Pose)
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
   ;; bool _follow
     (setq _follow (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _trajectory_mode
     (setq _trajectory_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _radio
     (setq _radio (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get rm_msgs::CartePosCustom :md5sum-) "af7ee1edb545e20ac1d00c5aeafad8b0")
(setf (get rm_msgs::CartePosCustom :datatype-) "rm_msgs/CartePosCustom")
(setf (get rm_msgs::CartePosCustom :definition-)
      "geometry_msgs/Pose Pose
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



(provide :rm_msgs/CartePosCustom "af7ee1edb545e20ac1d00c5aeafad8b0")


