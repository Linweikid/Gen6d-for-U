; Auto-generated. Do not edit!


(cl:in-package rm_msgs-msg)


;//! \htmlinclude Joint_En_Flag.msg.html

(cl:defclass <Joint_En_Flag> (roslisp-msg-protocol:ros-message)
  ((joint_en_flag
    :reader joint_en_flag
    :initarg :joint_en_flag
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil)))
)

(cl:defclass Joint_En_Flag (<Joint_En_Flag>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Joint_En_Flag>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Joint_En_Flag)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rm_msgs-msg:<Joint_En_Flag> is deprecated: use rm_msgs-msg:Joint_En_Flag instead.")))

(cl:ensure-generic-function 'joint_en_flag-val :lambda-list '(m))
(cl:defmethod joint_en_flag-val ((m <Joint_En_Flag>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:joint_en_flag-val is deprecated.  Use rm_msgs-msg:joint_en_flag instead.")
  (joint_en_flag m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Joint_En_Flag>) ostream)
  "Serializes a message object of type '<Joint_En_Flag>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_en_flag))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'joint_en_flag))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Joint_En_Flag>) istream)
  "Deserializes a message object of type '<Joint_En_Flag>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_en_flag) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_en_flag)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Joint_En_Flag>)))
  "Returns string type for a message object of type '<Joint_En_Flag>"
  "rm_msgs/Joint_En_Flag")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Joint_En_Flag)))
  "Returns string type for a message object of type 'Joint_En_Flag"
  "rm_msgs/Joint_En_Flag")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Joint_En_Flag>)))
  "Returns md5sum for a message object of type '<Joint_En_Flag>"
  "e7e77bbef527559ebf285523745d1dc5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Joint_En_Flag)))
  "Returns md5sum for a message object of type 'Joint_En_Flag"
  "e7e77bbef527559ebf285523745d1dc5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Joint_En_Flag>)))
  "Returns full string definition for message of type '<Joint_En_Flag>"
  (cl:format cl:nil "bool[] joint_en_flag~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Joint_En_Flag)))
  "Returns full string definition for message of type 'Joint_En_Flag"
  (cl:format cl:nil "bool[] joint_en_flag~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Joint_En_Flag>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_en_flag) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Joint_En_Flag>))
  "Converts a ROS message object to a list"
  (cl:list 'Joint_En_Flag
    (cl:cons ':joint_en_flag (joint_en_flag msg))
))
