;; Auto-generated. Do not edit!


(when (boundp 'rm_msgs::Arm_Current_Status)
  (if (not (find-package "RM_MSGS"))
    (make-package "RM_MSGS"))
  (shadow 'Arm_Current_Status (find-package "RM_MSGS")))
(unless (find-package "RM_MSGS::ARM_CURRENT_STATUS")
  (make-package "RM_MSGS::ARM_CURRENT_STATUS"))

(in-package "ROS")
;;//! \htmlinclude Arm_Current_Status.msg.html


(defclass rm_msgs::Arm_Current_Status
  :super ros::object
  :slots (_arm_current_status ))

(defmethod rm_msgs::Arm_Current_Status
  (:init
   (&key
    ((:arm_current_status __arm_current_status) "")
    )
   (send-super :init)
   (setq _arm_current_status (string __arm_current_status))
   self)
  (:arm_current_status
   (&optional __arm_current_status)
   (if __arm_current_status (setq _arm_current_status __arm_current_status)) _arm_current_status)
  (:serialization-length
   ()
   (+
    ;; string _arm_current_status
    4 (length _arm_current_status)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _arm_current_status
       (write-long (length _arm_current_status) s) (princ _arm_current_status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _arm_current_status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _arm_current_status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get rm_msgs::Arm_Current_Status :md5sum-) "22014e450b07851d8586a5146c339be8")
(setf (get rm_msgs::Arm_Current_Status :datatype-) "rm_msgs/Arm_Current_Status")
(setf (get rm_msgs::Arm_Current_Status :definition-)
      "string arm_current_status
")



(provide :rm_msgs/Arm_Current_Status "22014e450b07851d8586a5146c339be8")


