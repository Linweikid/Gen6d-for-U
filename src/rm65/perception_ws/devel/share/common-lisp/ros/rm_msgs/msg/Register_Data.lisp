; Auto-generated. Do not edit!


(cl:in-package rm_msgs-msg)


;//! \htmlinclude Register_Data.msg.html

(cl:defclass <Register_Data> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (state
    :reader state
    :initarg :state
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Register_Data (<Register_Data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Register_Data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Register_Data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rm_msgs-msg:<Register_Data> is deprecated: use rm_msgs-msg:Register_Data instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <Register_Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:data-val is deprecated.  Use rm_msgs-msg:data instead.")
  (data m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <Register_Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:state-val is deprecated.  Use rm_msgs-msg:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Register_Data>) ostream)
  "Serializes a message object of type '<Register_Data>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'data))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Register_Data>) istream)
  "Deserializes a message object of type '<Register_Data>"
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
    (cl:setf (cl:slot-value msg 'state) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Register_Data>)))
  "Returns string type for a message object of type '<Register_Data>"
  "rm_msgs/Register_Data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Register_Data)))
  "Returns string type for a message object of type 'Register_Data"
  "rm_msgs/Register_Data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Register_Data>)))
  "Returns md5sum for a message object of type '<Register_Data>"
  "ca800c21ed60db7e7472b2720ef8f45e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Register_Data)))
  "Returns md5sum for a message object of type 'Register_Data"
  "ca800c21ed60db7e7472b2720ef8f45e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Register_Data>)))
  "Returns full string definition for message of type '<Register_Data>"
  (cl:format cl:nil "uint16[] data~%bool state~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Register_Data)))
  "Returns full string definition for message of type 'Register_Data"
  (cl:format cl:nil "uint16[] data~%bool state~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Register_Data>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Register_Data>))
  "Converts a ROS message object to a list"
  (cl:list 'Register_Data
    (cl:cons ':data (data msg))
    (cl:cons ':state (state msg))
))
