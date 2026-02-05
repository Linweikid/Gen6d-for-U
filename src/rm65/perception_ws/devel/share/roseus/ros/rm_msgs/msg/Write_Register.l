;; Auto-generated. Do not edit!


(when (boundp 'rm_msgs::Write_Register)
  (if (not (find-package "RM_MSGS"))
    (make-package "RM_MSGS"))
  (shadow 'Write_Register (find-package "RM_MSGS")))
(unless (find-package "RM_MSGS::WRITE_REGISTER")
  (make-package "RM_MSGS::WRITE_REGISTER"))

(in-package "ROS")
;;//! \htmlinclude Write_Register.msg.html


(defclass rm_msgs::Write_Register
  :super ros::object
  :slots (_port _address _num _data _device ))

(defmethod rm_msgs::Write_Register
  (:init
   (&key
    ((:port __port) 0)
    ((:address __address) 0)
    ((:num __num) 0)
    ((:data __data) (make-array 0 :initial-element 0 :element-type :integer))
    ((:device __device) 0)
    )
   (send-super :init)
   (setq _port (round __port))
   (setq _address (round __address))
   (setq _num (round __num))
   (setq _data __data)
   (setq _device (round __device))
   self)
  (:port
   (&optional __port)
   (if __port (setq _port __port)) _port)
  (:address
   (&optional __address)
   (if __address (setq _address __address)) _address)
  (:num
   (&optional __num)
   (if __num (setq _num __num)) _num)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:device
   (&optional __device)
   (if __device (setq _device __device)) _device)
  (:serialization-length
   ()
   (+
    ;; uint8 _port
    1
    ;; uint32 _address
    4
    ;; uint32 _num
    4
    ;; uint16[] _data
    (* 2    (length _data)) 4
    ;; uint32 _device
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _port
       (write-byte _port s)
     ;; uint32 _address
       (write-long _address s)
     ;; uint32 _num
       (write-long _num s)
     ;; uint16[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (write-word (elt _data i) s)
       )
     ;; uint32 _device
       (write-long _device s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _port
     (setq _port (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint32 _address
     (setq _address (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _num
     (setq _num (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint16[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; uint32 _device
     (setq _device (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get rm_msgs::Write_Register :md5sum-) "3f824a8509f33e365cbdaf7a07757719")
(setf (get rm_msgs::Write_Register :datatype-) "rm_msgs/Write_Register")
(setf (get rm_msgs::Write_Register :definition-)
      "uint8 port
uint32 address
uint32 num
uint16[] data
uint32 device
")



(provide :rm_msgs/Write_Register "3f824a8509f33e365cbdaf7a07757719")


