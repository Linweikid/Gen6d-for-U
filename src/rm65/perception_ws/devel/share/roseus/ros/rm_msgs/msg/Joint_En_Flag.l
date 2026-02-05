;; Auto-generated. Do not edit!


(when (boundp 'rm_msgs::Joint_En_Flag)
  (if (not (find-package "RM_MSGS"))
    (make-package "RM_MSGS"))
  (shadow 'Joint_En_Flag (find-package "RM_MSGS")))
(unless (find-package "RM_MSGS::JOINT_EN_FLAG")
  (make-package "RM_MSGS::JOINT_EN_FLAG"))

(in-package "ROS")
;;//! \htmlinclude Joint_En_Flag.msg.html


(defclass rm_msgs::Joint_En_Flag
  :super ros::object
  :slots (_joint_en_flag ))

(defmethod rm_msgs::Joint_En_Flag
  (:init
   (&key
    ((:joint_en_flag __joint_en_flag) (let (r) (dotimes (i 0) (push nil r)) r))
    )
   (send-super :init)
   (setq _joint_en_flag __joint_en_flag)
   self)
  (:joint_en_flag
   (&optional __joint_en_flag)
   (if __joint_en_flag (setq _joint_en_flag __joint_en_flag)) _joint_en_flag)
  (:serialization-length
   ()
   (+
    ;; bool[] _joint_en_flag
    (* 1    (length _joint_en_flag)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool[] _joint_en_flag
     (write-long (length _joint_en_flag) s)
     (dotimes (i (length _joint_en_flag))
       (if (elt _joint_en_flag i) (write-byte -1 s) (write-byte 0 s))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool[] _joint_en_flag
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_en_flag (make-list n))
     (dotimes (i n)
     (setf (elt _joint_en_flag i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;;
   self)
  )

(setf (get rm_msgs::Joint_En_Flag :md5sum-) "e7e77bbef527559ebf285523745d1dc5")
(setf (get rm_msgs::Joint_En_Flag :datatype-) "rm_msgs/Joint_En_Flag")
(setf (get rm_msgs::Joint_En_Flag :definition-)
      "bool[] joint_en_flag

")



(provide :rm_msgs/Joint_En_Flag "e7e77bbef527559ebf285523745d1dc5")


