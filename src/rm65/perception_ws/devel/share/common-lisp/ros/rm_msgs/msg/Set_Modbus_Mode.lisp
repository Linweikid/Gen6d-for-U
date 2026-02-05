; Auto-generated. Do not edit!


(cl:in-package rm_msgs-msg)


;//! \htmlinclude Set_Modbus_Mode.msg.html

(cl:defclass <Set_Modbus_Mode> (roslisp-msg-protocol:ros-message)
  ((port
    :reader port
    :initarg :port
    :type cl:integer
    :initform 0)
   (baudrate
    :reader baudrate
    :initarg :baudrate
    :type cl:integer
    :initform 0)
   (timeout
    :reader timeout
    :initarg :timeout
    :type cl:integer
    :initform 0)
   (ip
    :reader ip
    :initarg :ip
    :type cl:string
    :initform ""))
)

(cl:defclass Set_Modbus_Mode (<Set_Modbus_Mode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Set_Modbus_Mode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Set_Modbus_Mode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rm_msgs-msg:<Set_Modbus_Mode> is deprecated: use rm_msgs-msg:Set_Modbus_Mode instead.")))

(cl:ensure-generic-function 'port-val :lambda-list '(m))
(cl:defmethod port-val ((m <Set_Modbus_Mode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:port-val is deprecated.  Use rm_msgs-msg:port instead.")
  (port m))

(cl:ensure-generic-function 'baudrate-val :lambda-list '(m))
(cl:defmethod baudrate-val ((m <Set_Modbus_Mode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:baudrate-val is deprecated.  Use rm_msgs-msg:baudrate instead.")
  (baudrate m))

(cl:ensure-generic-function 'timeout-val :lambda-list '(m))
(cl:defmethod timeout-val ((m <Set_Modbus_Mode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:timeout-val is deprecated.  Use rm_msgs-msg:timeout instead.")
  (timeout m))

(cl:ensure-generic-function 'ip-val :lambda-list '(m))
(cl:defmethod ip-val ((m <Set_Modbus_Mode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:ip-val is deprecated.  Use rm_msgs-msg:ip instead.")
  (ip m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Set_Modbus_Mode>) ostream)
  "Serializes a message object of type '<Set_Modbus_Mode>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'port)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'port)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'port)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'port)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'baudrate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'baudrate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'baudrate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'baudrate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timeout)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timeout)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'ip))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'ip))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Set_Modbus_Mode>) istream)
  "Deserializes a message object of type '<Set_Modbus_Mode>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'port)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'port)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'port)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'port)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'baudrate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'baudrate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'baudrate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'baudrate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timeout)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timeout)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ip) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'ip) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Set_Modbus_Mode>)))
  "Returns string type for a message object of type '<Set_Modbus_Mode>"
  "rm_msgs/Set_Modbus_Mode")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Set_Modbus_Mode)))
  "Returns string type for a message object of type 'Set_Modbus_Mode"
  "rm_msgs/Set_Modbus_Mode")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Set_Modbus_Mode>)))
  "Returns md5sum for a message object of type '<Set_Modbus_Mode>"
  "b976f7425d6e802fa67e71df2372ee55")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Set_Modbus_Mode)))
  "Returns md5sum for a message object of type 'Set_Modbus_Mode"
  "b976f7425d6e802fa67e71df2372ee55")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Set_Modbus_Mode>)))
  "Returns full string definition for message of type '<Set_Modbus_Mode>"
  (cl:format cl:nil "uint32 port~%uint32 baudrate~%uint32 timeout~%string ip~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Set_Modbus_Mode)))
  "Returns full string definition for message of type 'Set_Modbus_Mode"
  (cl:format cl:nil "uint32 port~%uint32 baudrate~%uint32 timeout~%string ip~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Set_Modbus_Mode>))
  (cl:+ 0
     4
     4
     4
     4 (cl:length (cl:slot-value msg 'ip))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Set_Modbus_Mode>))
  "Converts a ROS message object to a list"
  (cl:list 'Set_Modbus_Mode
    (cl:cons ':port (port msg))
    (cl:cons ':baudrate (baudrate msg))
    (cl:cons ':timeout (timeout msg))
    (cl:cons ':ip (ip msg))
))
