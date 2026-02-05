; Auto-generated. Do not edit!


(cl:in-package rm_msgs-msg)


;//! \htmlinclude Err.msg.html

(cl:defclass <Err> (roslisp-msg-protocol:ros-message)
  ((err
    :reader err
    :initarg :err
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass Err (<Err>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Err>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Err)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rm_msgs-msg:<Err> is deprecated: use rm_msgs-msg:Err instead.")))

(cl:ensure-generic-function 'err-val :lambda-list '(m))
(cl:defmethod err-val ((m <Err>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:err-val is deprecated.  Use rm_msgs-msg:err instead.")
  (err m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Err>) ostream)
  "Serializes a message object of type '<Err>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'err))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'err))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Err>) istream)
  "Deserializes a message object of type '<Err>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'err) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'err)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Err>)))
  "Returns string type for a message object of type '<Err>"
  "rm_msgs/Err")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Err)))
  "Returns string type for a message object of type 'Err"
  "rm_msgs/Err")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Err>)))
  "Returns md5sum for a message object of type '<Err>"
  "5b0a411346a36392edd94edb3ec31d40")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Err)))
  "Returns md5sum for a message object of type 'Err"
  "5b0a411346a36392edd94edb3ec31d40")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Err>)))
  "Returns full string definition for message of type '<Err>"
  (cl:format cl:nil "uint16[] err~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Err)))
  "Returns full string definition for message of type 'Err"
  (cl:format cl:nil "uint16[] err~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Err>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'err) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Err>))
  "Converts a ROS message object to a list"
  (cl:list 'Err
    (cl:cons ':err (err msg))
))
