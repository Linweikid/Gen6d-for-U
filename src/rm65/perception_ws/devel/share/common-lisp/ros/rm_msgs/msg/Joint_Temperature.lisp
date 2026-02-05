; Auto-generated. Do not edit!


(cl:in-package rm_msgs-msg)


;//! \htmlinclude Joint_Temperature.msg.html

(cl:defclass <Joint_Temperature> (roslisp-msg-protocol:ros-message)
  ((joint_temperature
    :reader joint_temperature
    :initarg :joint_temperature
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Joint_Temperature (<Joint_Temperature>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Joint_Temperature>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Joint_Temperature)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rm_msgs-msg:<Joint_Temperature> is deprecated: use rm_msgs-msg:Joint_Temperature instead.")))

(cl:ensure-generic-function 'joint_temperature-val :lambda-list '(m))
(cl:defmethod joint_temperature-val ((m <Joint_Temperature>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:joint_temperature-val is deprecated.  Use rm_msgs-msg:joint_temperature instead.")
  (joint_temperature m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Joint_Temperature>) ostream)
  "Serializes a message object of type '<Joint_Temperature>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_temperature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'joint_temperature))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Joint_Temperature>) istream)
  "Deserializes a message object of type '<Joint_Temperature>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_temperature) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_temperature)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Joint_Temperature>)))
  "Returns string type for a message object of type '<Joint_Temperature>"
  "rm_msgs/Joint_Temperature")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Joint_Temperature)))
  "Returns string type for a message object of type 'Joint_Temperature"
  "rm_msgs/Joint_Temperature")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Joint_Temperature>)))
  "Returns md5sum for a message object of type '<Joint_Temperature>"
  "7dbb3b0458bf6107a0e5950b28f68abf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Joint_Temperature)))
  "Returns md5sum for a message object of type 'Joint_Temperature"
  "7dbb3b0458bf6107a0e5950b28f68abf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Joint_Temperature>)))
  "Returns full string definition for message of type '<Joint_Temperature>"
  (cl:format cl:nil "float32[] joint_temperature~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Joint_Temperature)))
  "Returns full string definition for message of type 'Joint_Temperature"
  (cl:format cl:nil "float32[] joint_temperature~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Joint_Temperature>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_temperature) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Joint_Temperature>))
  "Converts a ROS message object to a list"
  (cl:list 'Joint_Temperature
    (cl:cons ':joint_temperature (joint_temperature msg))
))
