;; Auto-generated. Do not edit!


(when (boundp 'rm_msgs::Joint_Temperature)
  (if (not (find-package "RM_MSGS"))
    (make-package "RM_MSGS"))
  (shadow 'Joint_Temperature (find-package "RM_MSGS")))
(unless (find-package "RM_MSGS::JOINT_TEMPERATURE")
  (make-package "RM_MSGS::JOINT_TEMPERATURE"))

(in-package "ROS")
;;//! \htmlinclude Joint_Temperature.msg.html


(defclass rm_msgs::Joint_Temperature
  :super ros::object
  :slots (_joint_temperature ))

(defmethod rm_msgs::Joint_Temperature
  (:init
   (&key
    ((:joint_temperature __joint_temperature) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _joint_temperature __joint_temperature)
   self)
  (:joint_temperature
   (&optional __joint_temperature)
   (if __joint_temperature (setq _joint_temperature __joint_temperature)) _joint_temperature)
  (:serialization-length
   ()
   (+
    ;; float32[] _joint_temperature
    (* 4    (length _joint_temperature)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _joint_temperature
     (write-long (length _joint_temperature) s)
     (dotimes (i (length _joint_temperature))
       (sys::poke (elt _joint_temperature i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _joint_temperature
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_temperature (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _joint_temperature i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get rm_msgs::Joint_Temperature :md5sum-) "7dbb3b0458bf6107a0e5950b28f68abf")
(setf (get rm_msgs::Joint_Temperature :datatype-) "rm_msgs/Joint_Temperature")
(setf (get rm_msgs::Joint_Temperature :definition-)
      "float32[] joint_temperature
")



(provide :rm_msgs/Joint_Temperature "7dbb3b0458bf6107a0e5950b28f68abf")


