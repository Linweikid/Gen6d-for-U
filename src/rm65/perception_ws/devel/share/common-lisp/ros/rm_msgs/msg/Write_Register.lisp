; Auto-generated. Do not edit!


(cl:in-package rm_msgs-msg)


;//! \htmlinclude Write_Register.msg.html

(cl:defclass <Write_Register> (roslisp-msg-protocol:ros-message)
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
   (data
    :reader data
    :initarg :data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (device
    :reader device
    :initarg :device
    :type cl:integer
    :initform 0))
)

(cl:defclass Write_Register (<Write_Register>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Write_Register>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Write_Register)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rm_msgs-msg:<Write_Register> is deprecated: use rm_msgs-msg:Write_Register instead.")))

(cl:ensure-generic-function 'port-val :lambda-list '(m))
(cl:defmethod port-val ((m <Write_Register>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:port-val is deprecated.  Use rm_msgs-msg:port instead.")
  (port m))

(cl:ensure-generic-function 'address-val :lambda-list '(m))
(cl:defmethod address-val ((m <Write_Register>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:address-val is deprecated.  Use rm_msgs-msg:address instead.")
  (address m))

(cl:ensure-generic-function 'num-val :lambda-list '(m))
(cl:defmethod num-val ((m <Write_Register>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:num-val is deprecated.  Use rm_msgs-msg:num instead.")
  (num m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <Write_Register>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:data-val is deprecated.  Use rm_msgs-msg:data instead.")
  (data m))

(cl:ensure-generic-function 'device-val :lambda-list '(m))
(cl:defmethod device-val ((m <Write_Register>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:device-val is deprecated.  Use rm_msgs-msg:device instead.")
  (device m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Write_Register>) ostream)
  "Serializes a message object of type '<Write_Register>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'port)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'address)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'address)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'address)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'address)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'num)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'data))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'device)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'device)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'device)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'device)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Write_Register>) istream)
  "Deserializes a message object of type '<Write_Register>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'port)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'address)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'address)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'address)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'address)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'num)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'device)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'device)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'device)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'device)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Write_Register>)))
  "Returns string type for a message object of type '<Write_Register>"
  "rm_msgs/Write_Register")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Write_Register)))
  "Returns string type for a message object of type 'Write_Register"
  "rm_msgs/Write_Register")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Write_Register>)))
  "Returns md5sum for a message object of type '<Write_Register>"
  "3f824a8509f33e365cbdaf7a07757719")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Write_Register)))
  "Returns md5sum for a message object of type 'Write_Register"
  "3f824a8509f33e365cbdaf7a07757719")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Write_Register>)))
  "Returns full string definition for message of type '<Write_Register>"
  (cl:format cl:nil "uint8 port~%uint32 address~%uint32 num~%uint16[] data~%uint32 device~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Write_Register)))
  "Returns full string definition for message of type 'Write_Register"
  (cl:format cl:nil "uint8 port~%uint32 address~%uint32 num~%uint16[] data~%uint32 device~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Write_Register>))
  (cl:+ 0
     1
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Write_Register>))
  "Converts a ROS message object to a list"
  (cl:list 'Write_Register
    (cl:cons ':port (port msg))
    (cl:cons ':address (address msg))
    (cl:cons ':num (num msg))
    (cl:cons ':data (data msg))
    (cl:cons ':device (device msg))
))
