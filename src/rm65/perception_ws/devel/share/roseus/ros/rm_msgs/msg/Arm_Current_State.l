;; Auto-generated. Do not edit!


(when (boundp 'rm_msgs::Arm_Current_State)
  (if (not (find-package "RM_MSGS"))
    (make-package "RM_MSGS"))
  (shadow 'Arm_Current_State (find-package "RM_MSGS")))
(unless (find-package "RM_MSGS::ARM_CURRENT_STATE")
  (make-package "RM_MSGS::ARM_CURRENT_STATE"))

(in-package "ROS")
;;//! \htmlinclude Arm_Current_State.msg.html


(defclass rm_msgs::Arm_Current_State
  :super ros::object
  :slots (_joint _Pose _err _dof ))

(defmethod rm_msgs::Arm_Current_State
  (:init
   (&key
    ((:joint __joint) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:Pose __Pose) (make-array 6 :initial-element 0.0 :element-type :float))
    ((:err __err) (make-array 0 :initial-element 0 :element-type :integer))
    ((:dof __dof) 0)
    )
   (send-super :init)
   (setq _joint __joint)
   (setq _Pose __Pose)
   (setq _err __err)
   (setq _dof (round __dof))
   self)
  (:joint
   (&optional __joint)
   (if __joint (setq _joint __joint)) _joint)
  (:Pose
   (&optional __Pose)
   (if __Pose (setq _Pose __Pose)) _Pose)
  (:err
   (&optional __err)
   (if __err (setq _err __err)) _err)
  (:dof
   (&optional __dof)
   (if __dof (setq _dof __dof)) _dof)
  (:serialization-length
   ()
   (+
    ;; float32[] _joint
    (* 4    (length _joint)) 4
    ;; float32[6] _Pose
    (* 4    6)
    ;; uint16[] _err
    (* 2    (length _err)) 4
    ;; uint8 _dof
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
     ;; float32[6] _Pose
     (dotimes (i 6)
       (sys::poke (elt _Pose i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; uint16[] _err
     (write-long (length _err) s)
     (dotimes (i (length _err))
       (write-word (elt _err i) s)
       )
     ;; uint8 _dof
       (write-byte _dof s)
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
   ;; float32[6] _Pose
   (dotimes (i (length _Pose))
     (setf (elt _Pose i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; uint16[] _err
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _err (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _err i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; uint8 _dof
     (setq _dof (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get rm_msgs::Arm_Current_State :md5sum-) "4c96583b56d85a30b9b36f7638260f04")
(setf (get rm_msgs::Arm_Current_State :datatype-) "rm_msgs/Arm_Current_State")
(setf (get rm_msgs::Arm_Current_State :definition-)
      "float32[] joint
float32[6] Pose
uint16[] err
uint8 dof


")



(provide :rm_msgs/Arm_Current_State "4c96583b56d85a30b9b36f7638260f04")


