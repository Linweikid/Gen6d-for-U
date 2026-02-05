; Auto-generated. Do not edit!


(cl:in-package rm_msgs-msg)


;//! \htmlinclude Joint_Speed.msg.html

(cl:defclass <Joint_Speed> (roslisp-msg-protocol:ros-message)
  ((joint_speed
    :reader joint_speed
    :initarg :joint_speed
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Joint_Speed (<Joint_Speed>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Joint_Speed>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Joint_Speed)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rm_msgs-msg:<Joint_Speed> is deprecated: use rm_msgs-msg:Joint_Speed instead.")))

(cl:ensure-generic-function 'joint_speed-val :lambda-list '(m))
(cl:defmethod joint_speed-val ((m <Joint_Speed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:joint_speed-val is deprecated.  Use rm_msgs-msg:joint_speed instead.")
  (joint_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Joint_Speed>) ostream)
  "Serializes a message object of type '<Joint_Speed>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'joint_speed))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Joint_Speed>) istream)
  "Deserializes a message object of type '<Joint_Speed>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_speed) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_speed)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Joint_Speed>)))
  "Returns string type for a message object of type '<Joint_Speed>"
  "rm_msgs/Joint_Speed")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Joint_Speed)))
  "Returns string type for a message object of type 'Joint_Speed"
  "rm_msgs/Joint_Speed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Joint_Speed>)))
  "Returns md5sum for a message object of type '<Joint_Speed>"
  "33fe593b138a7242a779a630fd20122e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Joint_Speed)))
  "Returns md5sum for a message object of type 'Joint_Speed"
  "33fe593b138a7242a779a630fd20122e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Joint_Speed>)))
  "Returns full string definition for message of type '<Joint_Speed>"
  (cl:format cl:nil "float32[] joint_speed~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Joint_Speed)))
  "Returns full string definition for message of type 'Joint_Speed"
  (cl:format cl:nil "float32[] joint_speed~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Joint_Speed>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_speed) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Joint_Speed>))
  "Converts a ROS message object to a list"
  (cl:list 'Joint_Speed
    (cl:cons ':joint_speed (joint_speed msg))
))
