;; Auto-generated. Do not edit!


(when (boundp 'rm_msgs::JointPosCustom)
  (if (not (find-package "RM_MSGS"))
    (make-package "RM_MSGS"))
  (shadow 'JointPosCustom (find-package "RM_MSGS")))
(unless (find-package "RM_MSGS::JOINTPOSCUSTOM")
  (make-package "RM_MSGS::JOINTPOSCUSTOM"))

(in-package "ROS")
;;//! \htmlinclude JointPosCustom.msg.html


(defclass rm_msgs::JointPosCustom
  :super ros::object
  :slots (_joint _expand _follow _trajectory_mode _radio ))

(defmethod rm_msgs::JointPosCustom
  (:init
   (&key
    ((:joint __joint) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:expand __expand) 0.0)
    ((:follow __follow) nil)
    ((:trajectory_mode __trajectory_mode) 0)
    ((:radio __radio) 0)
    )
   (send-super :init)
   (setq _joint __joint)
   (setq _expand (float __expand))
   (setq _follow __follow)
   (setq _trajectory_mode (round __trajectory_mode))
   (setq _radio (round __radio))
   self)
  (:joint
   (&optional __joint)
   (if __joint (setq _joint __joint)) _joint)
  (:expand
   (&optional __expand)
   (if __expand (setq _expand __expand)) _expand)
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
    ;; float32[] _joint
    (* 4    (length _joint)) 4
    ;; float32 _expand
    4
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
     ;; float32[] _joint
     (write-long (length _joint) s)
     (dotimes (i (length _joint))
       (sys::poke (elt _joint i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _expand
       (sys::poke _expand (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
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
   ;; float32[] _joint
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _joint i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32 _expand
     (setq _expand (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _follow
     (setq _follow (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _trajectory_mode
     (setq _trajectory_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _radio
     (setq _radio (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get rm_msgs::JointPosCustom :md5sum-) "2953fc21da6104e47b8b6b70f74f1aee")
(setf (get rm_msgs::JointPosCustom :datatype-) "rm_msgs/JointPosCustom")
(setf (get rm_msgs::JointPosCustom :definition-)
      "#control arm joints without planning

float32[] joint
float32    expand
bool follow
uint8 trajectory_mode
uint8 radio
")



(provide :rm_msgs/JointPosCustom "2953fc21da6104e47b8b6b70f74f1aee")


