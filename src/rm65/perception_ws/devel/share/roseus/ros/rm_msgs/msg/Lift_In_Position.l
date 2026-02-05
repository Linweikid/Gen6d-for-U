;; Auto-generated. Do not edit!


(when (boundp 'rm_msgs::Lift_In_Position)
  (if (not (find-package "RM_MSGS"))
    (make-package "RM_MSGS"))
  (shadow 'Lift_In_Position (find-package "RM_MSGS")))
(unless (find-package "RM_MSGS::LIFT_IN_POSITION")
  (make-package "RM_MSGS::LIFT_IN_POSITION"))

(in-package "ROS")
;;//! \htmlinclude Lift_In_Position.msg.html


(defclass rm_msgs::Lift_In_Position
  :super ros::object
  :slots (_device _state _trajectory_connect _trajectory_state ))

(defmethod rm_msgs::Lift_In_Position
  (:init
   (&key
    ((:device __device) 0)
    ((:state __state) "")
    ((:trajectory_connect __trajectory_connect) 0)
    ((:trajectory_state __trajectory_state) nil)
    )
   (send-super :init)
   (setq _device (round __device))
   (setq _state (string __state))
   (setq _trajectory_connect (round __trajectory_connect))
   (setq _trajectory_state __trajectory_state)
   self)
  (:device
   (&optional __device)
   (if __device (setq _device __device)) _device)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:trajectory_connect
   (&optional __trajectory_connect)
   (if __trajectory_connect (setq _trajectory_connect __trajectory_connect)) _trajectory_connect)
  (:trajectory_state
   (&optional (__trajectory_state :null))
   (if (not (eq __trajectory_state :null)) (setq _trajectory_state __trajectory_state)) _trajectory_state)
  (:serialization-length
   ()
   (+
    ;; uint8 _device
    1
    ;; string _state
    4 (length _state)
    ;; uint8 _trajectory_connect
    1
    ;; bool _trajectory_state
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _device
       (write-byte _device s)
     ;; string _state
       (write-long (length _state) s) (princ _state s)
     ;; uint8 _trajectory_connect
       (write-byte _trajectory_connect s)
     ;; bool _trajectory_state
       (if _trajectory_state (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _device
     (setq _device (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _state
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _state (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _trajectory_connect
     (setq _trajectory_connect (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _trajectory_state
     (setq _trajectory_state (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get rm_msgs::Lift_In_Position :md5sum-) "8560798487e4b58bf325a3d3d0cad027")
(setf (get rm_msgs::Lift_In_Position :datatype-) "rm_msgs/Lift_In_Position")
(setf (get rm_msgs::Lift_In_Position :definition-)
      "uint8 device
string state
uint8 trajectory_connect
bool trajectory_state
")



(provide :rm_msgs/Lift_In_Position "8560798487e4b58bf325a3d3d0cad027")


