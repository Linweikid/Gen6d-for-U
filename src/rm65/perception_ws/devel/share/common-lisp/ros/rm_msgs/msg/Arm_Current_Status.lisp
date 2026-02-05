; Auto-generated. Do not edit!


(cl:in-package rm_msgs-msg)


;//! \htmlinclude Arm_Current_Status.msg.html

(cl:defclass <Arm_Current_Status> (roslisp-msg-protocol:ros-message)
  ((arm_current_status
    :reader arm_current_status
    :initarg :arm_current_status
    :type cl:string
    :initform ""))
)

(cl:defclass Arm_Current_Status (<Arm_Current_Status>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Arm_Current_Status>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Arm_Current_Status)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rm_msgs-msg:<Arm_Current_Status> is deprecated: use rm_msgs-msg:Arm_Current_Status instead.")))

(cl:ensure-generic-function 'arm_current_status-val :lambda-list '(m))
(cl:defmethod arm_current_status-val ((m <Arm_Current_Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:arm_current_status-val is deprecated.  Use rm_msgs-msg:arm_current_status instead.")
  (arm_current_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Arm_Current_Status>) ostream)
  "Serializes a message object of type '<Arm_Current_Status>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'arm_current_status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'arm_current_status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Arm_Current_Status>) istream)
  "Deserializes a message object of type '<Arm_Current_Status>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'arm_current_status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'arm_current_status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Arm_Current_Status>)))
  "Returns string type for a message object of type '<Arm_Current_Status>"
  "rm_msgs/Arm_Current_Status")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Arm_Current_Status)))
  "Returns string type for a message object of type 'Arm_Current_Status"
  "rm_msgs/Arm_Current_Status")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Arm_Current_Status>)))
  "Returns md5sum for a message object of type '<Arm_Current_Status>"
  "22014e450b07851d8586a5146c339be8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Arm_Current_Status)))
  "Returns md5sum for a message object of type 'Arm_Current_Status"
  "22014e450b07851d8586a5146c339be8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Arm_Current_Status>)))
  "Returns full string definition for message of type '<Arm_Current_Status>"
  (cl:format cl:nil "string arm_current_status~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Arm_Current_Status)))
  "Returns full string definition for message of type 'Arm_Current_Status"
  (cl:format cl:nil "string arm_current_status~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Arm_Current_Status>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'arm_current_status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Arm_Current_Status>))
  "Converts a ROS message object to a list"
  (cl:list 'Arm_Current_Status
    (cl:cons ':arm_current_status (arm_current_status msg))
))
