; Auto-generated. Do not edit!


(cl:in-package rm_msgs-msg)


;//! \htmlinclude Read_Register.msg.html

(cl:defclass <Read_Register> (roslisp-msg-protocol:ros-message)
  ((port
    :reader port
    :initarg :port
    :type cl:fixnum
    :initform 0)
   (address
    :reader address
    :initarg :address
    :type cl:integer
    :initform 0)
   (num
    :reader num
    :initarg :num
    :type cl:integer
    :initform 0)
   (device
    :reader device
    :initarg :device
    :type cl:integer
    :initform 0))
)

(cl:defclass Read_Register (<Read_Register>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Read_Register>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Read_Register)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rm_msgs-msg:<Read_Register> is deprecated: use rm_msgs-msg:Read_Register instead.")))

(cl:ensure-generic-function 'port-val :lambda-list '(m))
(cl:defmethod port-val ((m <Read_Register>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:port-val is deprecated.  Use rm_msgs-msg:port instead.")
  (port m))

(cl:ensure-generic-function 'address-val :lambda-list '(m))
(cl:defmethod address-val ((m <Read_Register>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:address-val is deprecated.  Use rm_msgs-msg:address instead.")
  (address m))

(cl:ensure-generic-function 'num-val :lambda-list '(m))
(cl:defmethod num-val ((m <Read_Register>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:num-val is deprecated.  Use rm_msgs-msg:num instead.")
  (num m))

(cl:ensure-generic-function 'device-val :lambda-list '(m))
(cl:defmethod device-val ((m <Read_Register>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:device-val is deprecated.  Use rm_msgs-msg:device instead.")
  (device m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Read_Register>) ostream)
  "Serializes a message object of type '<Read_Register>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'port)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'address)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'address)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'address)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'address)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'device)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'device)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'device)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'device)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Read_Register>) istream)
  "Deserializes a message object of type '<Read_Register>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'port)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'address)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'address)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'address)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'address)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'device)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'device)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'device)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'device)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Read_Register>)))
  "Returns string type for a message object of type '<Read_Register>"
  "rm_msgs/Read_Register")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Read_Register)))
  "Returns string type for a message object of type 'Read_Register"
  "rm_msgs/Read_Register")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Read_Register>)))
  "Returns md5sum for a message object of type '<Read_Register>"
  "e80462a4b4637747ba287fa5251e9e0c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Read_Register)))
  "Returns md5sum for a message object of type 'Read_Register"
  "e80462a4b4637747ba287fa5251e9e0c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Read_Register>)))
  "Returns full string definition for message of type '<Read_Register>"
  (cl:format cl:nil "uint8 port~%uint32 address~%uint32 num~%uint32 device~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Read_Register)))
  "Returns full string definition for message of type 'Read_Register"
  (cl:format cl:nil "uint8 port~%uint32 address~%uint32 num~%uint32 device~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Read_Register>))
  (cl:+ 0
     1
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Read_Register>))
  "Converts a ROS message object to a list"
  (cl:list 'Read_Register
    (cl:cons ':port (port msg))
    (cl:cons ':address (address msg))
    (cl:cons ':num (num msg))
    (cl:cons ':device (device msg))
))
