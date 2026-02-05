; Auto-generated. Do not edit!


(cl:in-package rm_msgs-msg)


;//! \htmlinclude RS485_Mode.msg.html

(cl:defclass <RS485_Mode> (roslisp-msg-protocol:ros-message)
  ((controller_RS485_mode
    :reader controller_RS485_mode
    :initarg :controller_RS485_mode
    :type cl:fixnum
    :initform 0)
   (tool_RS485_mode
    :reader tool_RS485_mode
    :initarg :tool_RS485_mode
    :type cl:fixnum
    :initform 0)
   (baudrate
    :reader baudrate
    :initarg :baudrate
    :type cl:integer
    :initform 0)
   (modbus_timeout
    :reader modbus_timeout
    :initarg :modbus_timeout
    :type cl:integer
    :initform 0))
)

(cl:defclass RS485_Mode (<RS485_Mode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RS485_Mode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RS485_Mode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rm_msgs-msg:<RS485_Mode> is deprecated: use rm_msgs-msg:RS485_Mode instead.")))

(cl:ensure-generic-function 'controller_RS485_mode-val :lambda-list '(m))
(cl:defmethod controller_RS485_mode-val ((m <RS485_Mode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:controller_RS485_mode-val is deprecated.  Use rm_msgs-msg:controller_RS485_mode instead.")
  (controller_RS485_mode m))

(cl:ensure-generic-function 'tool_RS485_mode-val :lambda-list '(m))
(cl:defmethod tool_RS485_mode-val ((m <RS485_Mode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:tool_RS485_mode-val is deprecated.  Use rm_msgs-msg:tool_RS485_mode instead.")
  (tool_RS485_mode m))

(cl:ensure-generic-function 'baudrate-val :lambda-list '(m))
(cl:defmethod baudrate-val ((m <RS485_Mode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:baudrate-val is deprecated.  Use rm_msgs-msg:baudrate instead.")
  (baudrate m))

(cl:ensure-generic-function 'modbus_timeout-val :lambda-list '(m))
(cl:defmethod modbus_timeout-val ((m <RS485_Mode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:modbus_timeout-val is deprecated.  Use rm_msgs-msg:modbus_timeout instead.")
  (modbus_timeout m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RS485_Mode>) ostream)
  "Serializes a message object of type '<RS485_Mode>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'controller_RS485_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tool_RS485_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'baudrate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'baudrate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'baudrate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'baudrate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'modbus_timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'modbus_timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'modbus_timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'modbus_timeout)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RS485_Mode>) istream)
  "Deserializes a message object of type '<RS485_Mode>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'controller_RS485_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'tool_RS485_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'baudrate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'baudrate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'baudrate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'baudrate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'modbus_timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'modbus_timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'modbus_timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'modbus_timeout)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RS485_Mode>)))
  "Returns string type for a message object of type '<RS485_Mode>"
  "rm_msgs/RS485_Mode")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RS485_Mode)))
  "Returns string type for a message object of type 'RS485_Mode"
  "rm_msgs/RS485_Mode")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RS485_Mode>)))
  "Returns md5sum for a message object of type '<RS485_Mode>"
  "68f472696d75d9d22a962adaba389926")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RS485_Mode)))
  "Returns md5sum for a message object of type 'RS485_Mode"
  "68f472696d75d9d22a962adaba389926")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RS485_Mode>)))
  "Returns full string definition for message of type '<RS485_Mode>"
  (cl:format cl:nil "uint8 controller_RS485_mode~%uint8 tool_RS485_mode~%uint32 baudrate~%uint32 modbus_timeout~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RS485_Mode)))
  "Returns full string definition for message of type 'RS485_Mode"
  (cl:format cl:nil "uint8 controller_RS485_mode~%uint8 tool_RS485_mode~%uint32 baudrate~%uint32 modbus_timeout~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RS485_Mode>))
  (cl:+ 0
     1
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RS485_Mode>))
  "Converts a ROS message object to a list"
  (cl:list 'RS485_Mode
    (cl:cons ':controller_RS485_mode (controller_RS485_mode msg))
    (cl:cons ':tool_RS485_mode (tool_RS485_mode msg))
    (cl:cons ':baudrate (baudrate msg))
    (cl:cons ':modbus_timeout (modbus_timeout msg))
))
