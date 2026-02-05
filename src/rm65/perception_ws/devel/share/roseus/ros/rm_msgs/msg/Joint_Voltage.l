;; Auto-generated. Do not edit!


(when (boundp 'rm_msgs::Joint_Voltage)
  (if (not (find-package "RM_MSGS"))
    (make-package "RM_MSGS"))
  (shadow 'Joint_Voltage (find-package "RM_MSGS")))
(unless (find-package "RM_MSGS::JOINT_VOLTAGE")
  (make-package "RM_MSGS::JOINT_VOLTAGE"))

(in-package "ROS")
;;//! \htmlinclude Joint_Voltage.msg.html


(defclass rm_msgs::Joint_Voltage
  :super ros::object
  :slots (_joint_voltage ))

(defmethod rm_msgs::Joint_Voltage
  (:init
   (&key
    ((:joint_voltage __joint_voltage) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _joint_voltage __joint_voltage)
   self)
  (:joint_voltage
   (&optional __joint_voltage)
   (if __joint_voltage (setq _joint_voltage __joint_voltage)) _joint_voltage)
  (:serialization-length
   ()
   (+
    ;; float32[] _joint_voltage
    (* 4    (length _joint_voltage)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _joint_voltage
     (write-long (length _joint_voltage) s)
     (dotimes (i (length _joint_voltage))
       (sys::poke (elt _joint_voltage i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _joint_voltage
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_voltage (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _joint_voltage i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get rm_msgs::Joint_Voltage :md5sum-) "f712751501e1263b5499f008c4b07694")
(setf (get rm_msgs::Joint_Voltage :datatype-) "rm_msgs/Joint_Voltage")
(setf (get rm_msgs::Joint_Voltage :definition-)
      "float32[] joint_voltage
")



(provide :rm_msgs/Joint_Voltage "f712751501e1263b5499f008c4b07694")


