;; Auto-generated. Do not edit!


(when (boundp 'rm_msgs::Register_Data)
  (if (not (find-package "RM_MSGS"))
    (make-package "RM_MSGS"))
  (shadow 'Register_Data (find-package "RM_MSGS")))
(unless (find-package "RM_MSGS::REGISTER_DATA")
  (make-package "RM_MSGS::REGISTER_DATA"))

(in-package "ROS")
;;//! \htmlinclude Register_Data.msg.html


(defclass rm_msgs::Register_Data
  :super ros::object
  :slots (_data _state ))

(defmethod rm_msgs::Register_Data
  (:init
   (&key
    ((:data __data) (make-array 0 :initial-element 0 :element-type :integer))
    ((:state __state) nil)
    )
   (send-super :init)
   (setq _data __data)
   (setq _state __state)
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:state
   (&optional (__state :null))
   (if (not (eq __state :null)) (setq _state __state)) _state)
  (:serialization-length
   ()
   (+
    ;; uint16[] _data
    (* 2    (length _data)) 4
    ;; bool _state
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (write-word (elt _data i) s)
       )
     ;; bool _state
       (if _state (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; bool _state
     (setq _state (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get rm_msgs::Register_Data :md5sum-) "ca800c21ed60db7e7472b2720ef8f45e")
(setf (get rm_msgs::Register_Data :datatype-) "rm_msgs/Register_Data")
(setf (get rm_msgs::Register_Data :definition-)
      "uint16[] data
bool state
")



(provide :rm_msgs/Register_Data "ca800c21ed60db7e7472b2720ef8f45e")


