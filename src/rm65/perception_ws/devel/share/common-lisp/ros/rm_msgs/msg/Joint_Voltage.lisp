; Auto-generated. Do not edit!


(cl:in-package rm_msgs-msg)


;//! \htmlinclude Joint_Voltage.msg.html

(cl:defclass <Joint_Voltage> (roslisp-msg-protocol:ros-message)
  ((joint_voltage
    :reader joint_voltage
    :initarg :joint_voltage
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Joint_Voltage (<Joint_Voltage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Joint_Voltage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Joint_Voltage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rm_msgs-msg:<Joint_Voltage> is deprecated: use rm_msgs-msg:Joint_Voltage instead.")))

(cl:ensure-generic-function 'joint_voltage-val :lambda-list '(m))
(cl:defmethod joint_voltage-val ((m <Joint_Voltage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:joint_voltage-val is deprecated.  Use rm_msgs-msg:joint_voltage instead.")
  (joint_voltage m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Joint_Voltage>) ostream)
  "Serializes a message object of type '<Joint_Voltage>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'joint_voltage))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Joint_Voltage>) istream)
  "Deserializes a message object of type '<Joint_Voltage>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_voltage) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_voltage)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Joint_Voltage>)))
  "Returns string type for a message object of type '<Joint_Voltage>"
  "rm_msgs/Joint_Voltage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Joint_Voltage)))
  "Returns string type for a message object of type 'Joint_Voltage"
  "rm_msgs/Joint_Voltage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Joint_Voltage>)))
  "Returns md5sum for a message object of type '<Joint_Voltage>"
  "f712751501e1263b5499f008c4b07694")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Joint_Voltage)))
  "Returns md5sum for a message object of type 'Joint_Voltage"
  "f712751501e1263b5499f008c4b07694")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Joint_Voltage>)))
  "Returns full string definition for message of type '<Joint_Voltage>"
  (cl:format cl:nil "float32[] joint_voltage~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Joint_Voltage)))
  "Returns full string definition for message of type 'Joint_Voltage"
  (cl:format cl:nil "float32[] joint_voltage~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Joint_Voltage>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_voltage) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Joint_Voltage>))
  "Converts a ROS message object to a list"
  (cl:list 'Joint_Voltage
    (cl:cons ':joint_voltage (joint_voltage msg))
))
