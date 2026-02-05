;; Auto-generated. Do not edit!


(when (boundp 'rm_msgs::Set_Modbus_Mode)
  (if (not (find-package "RM_MSGS"))
    (make-package "RM_MSGS"))
  (shadow 'Set_Modbus_Mode (find-package "RM_MSGS")))
(unless (find-package "RM_MSGS::SET_MODBUS_MODE")
  (make-package "RM_MSGS::SET_MODBUS_MODE"))

(in-package "ROS")
;;//! \htmlinclude Set_Modbus_Mode.msg.html


(defclass rm_msgs::Set_Modbus_Mode
  :super ros::object
  :slots (_port _baudrate _timeout _ip ))

(defmethod rm_msgs::Set_Modbus_Mode
  (:init
   (&key
    ((:port __port) 0)
    ((:baudrate __baudrate) 0)
    ((:timeout __timeout) 0)
    ((:ip __ip) "")
    )
   (send-super :init)
   (setq _port (round __port))
   (setq _baudrate (round __baudrate))
   (setq _timeout (round __timeout))
   (setq _ip (string __ip))
   self)
  (:port
   (&optional __port)
   (if __port (setq _port __port)) _port)
  (:baudrate
   (&optional __baudrate)
   (if __baudrate (setq _baudrate __baudrate)) _baudrate)
  (:timeout
   (&optional __timeout)
   (if __timeout (setq _timeout __timeout)) _timeout)
  (:ip
   (&optional __ip)
   (if __ip (setq _ip __ip)) _ip)
  (:serialization-length
   ()
   (+
    ;; uint32 _port
    4
    ;; uint32 _baudrate
    4
    ;; uint32 _timeout
    4
    ;; string _ip
    4 (length _ip)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _port
       (write-long _port s)
     ;; uint32 _baudrate
       (write-long _baudrate s)
     ;; uint32 _timeout
       (write-long _timeout s)
     ;; string _ip
       (write-long (length _ip) s) (princ _ip s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _port
     (setq _port (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _baudrate
     (setq _baudrate (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _timeout
     (setq _timeout (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _ip
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _ip (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get rm_msgs::Set_Modbus_Mode :md5sum-) "b976f7425d6e802fa67e71df2372ee55")
(setf (get rm_msgs::Set_Modbus_Mode :datatype-) "rm_msgs/Set_Modbus_Mode")
(setf (get rm_msgs::Set_Modbus_Mode :definition-)
      "uint32 port
uint32 baudrate
uint32 timeout
string ip
")



(provide :rm_msgs/Set_Modbus_Mode "b976f7425d6e802fa67e71df2372ee55")


