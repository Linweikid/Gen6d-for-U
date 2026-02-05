;; Auto-generated. Do not edit!


(when (boundp 'rm_msgs::RS485_Mode)
  (if (not (find-package "RM_MSGS"))
    (make-package "RM_MSGS"))
  (shadow 'RS485_Mode (find-package "RM_MSGS")))
(unless (find-package "RM_MSGS::RS485_MODE")
  (make-package "RM_MSGS::RS485_MODE"))

(in-package "ROS")
;;//! \htmlinclude RS485_Mode.msg.html


(defclass rm_msgs::RS485_Mode
  :super ros::object
  :slots (_controller_RS485_mode _tool_RS485_mode _baudrate _modbus_timeout ))

(defmethod rm_msgs::RS485_Mode
  (:init
   (&key
    ((:controller_RS485_mode __controller_RS485_mode) 0)
    ((:tool_RS485_mode __tool_RS485_mode) 0)
    ((:baudrate __baudrate) 0)
    ((:modbus_timeout __modbus_timeout) 0)
    )
   (send-super :init)
   (setq _controller_RS485_mode (round __controller_RS485_mode))
   (setq _tool_RS485_mode (round __tool_RS485_mode))
   (setq _baudrate (round __baudrate))
   (setq _modbus_timeout (round __modbus_timeout))
   self)
  (:controller_RS485_mode
   (&optional __controller_RS485_mode)
   (if __controller_RS485_mode (setq _controller_RS485_mode __controller_RS485_mode)) _controller_RS485_mode)
  (:tool_RS485_mode
   (&optional __tool_RS485_mode)
   (if __tool_RS485_mode (setq _tool_RS485_mode __tool_RS485_mode)) _tool_RS485_mode)
  (:baudrate
   (&optional __baudrate)
   (if __baudrate (setq _baudrate __baudrate)) _baudrate)
  (:modbus_timeout
   (&optional __modbus_timeout)
   (if __modbus_timeout (setq _modbus_timeout __modbus_timeout)) _modbus_timeout)
  (:serialization-length
   ()
   (+
    ;; uint8 _controller_RS485_mode
    1
    ;; uint8 _tool_RS485_mode
    1
    ;; uint32 _baudrate
    4
    ;; uint32 _modbus_timeout
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _controller_RS485_mode
       (write-byte _controller_RS485_mode s)
     ;; uint8 _tool_RS485_mode
       (write-byte _tool_RS485_mode s)
     ;; uint32 _baudrate
       (write-long _baudrate s)
     ;; uint32 _modbus_timeout
       (write-long _modbus_timeout s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _controller_RS485_mode
     (setq _controller_RS485_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _tool_RS485_mode
     (setq _tool_RS485_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint32 _baudrate
     (setq _baudrate (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _modbus_timeout
     (setq _modbus_timeout (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get rm_msgs::RS485_Mode :md5sum-) "68f472696d75d9d22a962adaba389926")
(setf (get rm_msgs::RS485_Mode :datatype-) "rm_msgs/RS485_Mode")
(setf (get rm_msgs::RS485_Mode :definition-)
      "uint8 controller_RS485_mode
uint8 tool_RS485_mode
uint32 baudrate
uint32 modbus_timeout
")



(provide :rm_msgs/RS485_Mode "68f472696d75d9d22a962adaba389926")


