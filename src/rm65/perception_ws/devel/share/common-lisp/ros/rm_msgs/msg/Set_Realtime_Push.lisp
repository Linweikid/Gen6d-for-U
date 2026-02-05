; Auto-generated. Do not edit!


(cl:in-package rm_msgs-msg)


;//! \htmlinclude Set_Realtime_Push.msg.html

(cl:defclass <Set_Realtime_Push> (roslisp-msg-protocol:ros-message)
  ((cycle
    :reader cycle
    :initarg :cycle
    :type cl:fixnum
    :initform 0)
   (port
    :reader port
    :initarg :port
    :type cl:fixnum
    :initform 0)
   (force_coordinate
    :reader force_coordinate
    :initarg :force_coordinate
    :type cl:fixnum
    :initform 0)
   (ip
    :reader ip
    :initarg :ip
    :type cl:string
    :initform "")
   (aloha_state_enable
    :reader aloha_state_enable
    :initarg :aloha_state_enable
    :type cl:boolean
    :initform cl:nil)
   (arm_current_status_enable
    :reader arm_current_status_enable
    :initarg :arm_current_status_enable
    :type cl:boolean
    :initform cl:nil)
   (expand_state_enable
    :reader expand_state_enable
    :initarg :expand_state_enable
    :type cl:boolean
    :initform cl:nil)
   (hand_enable
    :reader hand_enable
    :initarg :hand_enable
    :type cl:boolean
    :initform cl:nil)
   (joint_acc_enable
    :reader joint_acc_enable
    :initarg :joint_acc_enable
    :type cl:boolean
    :initform cl:nil)
   (joint_speed_enable
    :reader joint_speed_enable
    :initarg :joint_speed_enable
    :type cl:boolean
    :initform cl:nil)
   (lift_state_enable
    :reader lift_state_enable
    :initarg :lift_state_enable
    :type cl:boolean
    :initform cl:nil)
   (tail_end_enable
    :reader tail_end_enable
    :initarg :tail_end_enable
    :type cl:boolean
    :initform cl:nil)
   (rm_plus_base_enable
    :reader rm_plus_base_enable
    :initarg :rm_plus_base_enable
    :type cl:boolean
    :initform cl:nil)
   (rm_plus_state_enable
    :reader rm_plus_state_enable
    :initarg :rm_plus_state_enable
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Set_Realtime_Push (<Set_Realtime_Push>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Set_Realtime_Push>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Set_Realtime_Push)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rm_msgs-msg:<Set_Realtime_Push> is deprecated: use rm_msgs-msg:Set_Realtime_Push instead.")))

(cl:ensure-generic-function 'cycle-val :lambda-list '(m))
(cl:defmethod cycle-val ((m <Set_Realtime_Push>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:cycle-val is deprecated.  Use rm_msgs-msg:cycle instead.")
  (cycle m))

(cl:ensure-generic-function 'port-val :lambda-list '(m))
(cl:defmethod port-val ((m <Set_Realtime_Push>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:port-val is deprecated.  Use rm_msgs-msg:port instead.")
  (port m))

(cl:ensure-generic-function 'force_coordinate-val :lambda-list '(m))
(cl:defmethod force_coordinate-val ((m <Set_Realtime_Push>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:force_coordinate-val is deprecated.  Use rm_msgs-msg:force_coordinate instead.")
  (force_coordinate m))

(cl:ensure-generic-function 'ip-val :lambda-list '(m))
(cl:defmethod ip-val ((m <Set_Realtime_Push>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:ip-val is deprecated.  Use rm_msgs-msg:ip instead.")
  (ip m))

(cl:ensure-generic-function 'aloha_state_enable-val :lambda-list '(m))
(cl:defmethod aloha_state_enable-val ((m <Set_Realtime_Push>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:aloha_state_enable-val is deprecated.  Use rm_msgs-msg:aloha_state_enable instead.")
  (aloha_state_enable m))

(cl:ensure-generic-function 'arm_current_status_enable-val :lambda-list '(m))
(cl:defmethod arm_current_status_enable-val ((m <Set_Realtime_Push>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:arm_current_status_enable-val is deprecated.  Use rm_msgs-msg:arm_current_status_enable instead.")
  (arm_current_status_enable m))

(cl:ensure-generic-function 'expand_state_enable-val :lambda-list '(m))
(cl:defmethod expand_state_enable-val ((m <Set_Realtime_Push>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:expand_state_enable-val is deprecated.  Use rm_msgs-msg:expand_state_enable instead.")
  (expand_state_enable m))

(cl:ensure-generic-function 'hand_enable-val :lambda-list '(m))
(cl:defmethod hand_enable-val ((m <Set_Realtime_Push>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:hand_enable-val is deprecated.  Use rm_msgs-msg:hand_enable instead.")
  (hand_enable m))

(cl:ensure-generic-function 'joint_acc_enable-val :lambda-list '(m))
(cl:defmethod joint_acc_enable-val ((m <Set_Realtime_Push>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:joint_acc_enable-val is deprecated.  Use rm_msgs-msg:joint_acc_enable instead.")
  (joint_acc_enable m))

(cl:ensure-generic-function 'joint_speed_enable-val :lambda-list '(m))
(cl:defmethod joint_speed_enable-val ((m <Set_Realtime_Push>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:joint_speed_enable-val is deprecated.  Use rm_msgs-msg:joint_speed_enable instead.")
  (joint_speed_enable m))

(cl:ensure-generic-function 'lift_state_enable-val :lambda-list '(m))
(cl:defmethod lift_state_enable-val ((m <Set_Realtime_Push>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:lift_state_enable-val is deprecated.  Use rm_msgs-msg:lift_state_enable instead.")
  (lift_state_enable m))

(cl:ensure-generic-function 'tail_end_enable-val :lambda-list '(m))
(cl:defmethod tail_end_enable-val ((m <Set_Realtime_Push>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:tail_end_enable-val is deprecated.  Use rm_msgs-msg:tail_end_enable instead.")
  (tail_end_enable m))

(cl:ensure-generic-function 'rm_plus_base_enable-val :lambda-list '(m))
(cl:defmethod rm_plus_base_enable-val ((m <Set_Realtime_Push>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:rm_plus_base_enable-val is deprecated.  Use rm_msgs-msg:rm_plus_base_enable instead.")
  (rm_plus_base_enable m))

(cl:ensure-generic-function 'rm_plus_state_enable-val :lambda-list '(m))
(cl:defmethod rm_plus_state_enable-val ((m <Set_Realtime_Push>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:rm_plus_state_enable-val is deprecated.  Use rm_msgs-msg:rm_plus_state_enable instead.")
  (rm_plus_state_enable m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Set_Realtime_Push>) ostream)
  "Serializes a message object of type '<Set_Realtime_Push>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cycle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cycle)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'port)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'port)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'force_coordinate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'force_coordinate)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'ip))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'ip))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'aloha_state_enable) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'arm_current_status_enable) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'expand_state_enable) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'hand_enable) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'joint_acc_enable) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'joint_speed_enable) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'lift_state_enable) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'tail_end_enable) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'rm_plus_base_enable) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'rm_plus_state_enable) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Set_Realtime_Push>) istream)
  "Deserializes a message object of type '<Set_Realtime_Push>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cycle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'cycle)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'port)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'port)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'force_coordinate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'force_coordinate)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ip) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'ip) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'aloha_state_enable) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'arm_current_status_enable) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'expand_state_enable) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'hand_enable) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'joint_acc_enable) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'joint_speed_enable) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'lift_state_enable) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'tail_end_enable) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'rm_plus_base_enable) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'rm_plus_state_enable) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Set_Realtime_Push>)))
  "Returns string type for a message object of type '<Set_Realtime_Push>"
  "rm_msgs/Set_Realtime_Push")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Set_Realtime_Push)))
  "Returns string type for a message object of type 'Set_Realtime_Push"
  "rm_msgs/Set_Realtime_Push")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Set_Realtime_Push>)))
  "Returns md5sum for a message object of type '<Set_Realtime_Push>"
  "29a80623aa411fb9cc6b96b119e8d448")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Set_Realtime_Push)))
  "Returns md5sum for a message object of type 'Set_Realtime_Push"
  "29a80623aa411fb9cc6b96b119e8d448")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Set_Realtime_Push>)))
  "Returns full string definition for message of type '<Set_Realtime_Push>"
  (cl:format cl:nil "uint16 cycle~%uint16 port~%uint16 force_coordinate~%string ip~%bool aloha_state_enable~%bool arm_current_status_enable~%bool expand_state_enable~%bool hand_enable~%bool joint_acc_enable~%bool joint_speed_enable~%bool lift_state_enable~%bool tail_end_enable~%bool rm_plus_base_enable~%bool rm_plus_state_enable~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Set_Realtime_Push)))
  "Returns full string definition for message of type 'Set_Realtime_Push"
  (cl:format cl:nil "uint16 cycle~%uint16 port~%uint16 force_coordinate~%string ip~%bool aloha_state_enable~%bool arm_current_status_enable~%bool expand_state_enable~%bool hand_enable~%bool joint_acc_enable~%bool joint_speed_enable~%bool lift_state_enable~%bool tail_end_enable~%bool rm_plus_base_enable~%bool rm_plus_state_enable~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Set_Realtime_Push>))
  (cl:+ 0
     2
     2
     2
     4 (cl:length (cl:slot-value msg 'ip))
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Set_Realtime_Push>))
  "Converts a ROS message object to a list"
  (cl:list 'Set_Realtime_Push
    (cl:cons ':cycle (cycle msg))
    (cl:cons ':port (port msg))
    (cl:cons ':force_coordinate (force_coordinate msg))
    (cl:cons ':ip (ip msg))
    (cl:cons ':aloha_state_enable (aloha_state_enable msg))
    (cl:cons ':arm_current_status_enable (arm_current_status_enable msg))
    (cl:cons ':expand_state_enable (expand_state_enable msg))
    (cl:cons ':hand_enable (hand_enable msg))
    (cl:cons ':joint_acc_enable (joint_acc_enable msg))
    (cl:cons ':joint_speed_enable (joint_speed_enable msg))
    (cl:cons ':lift_state_enable (lift_state_enable msg))
    (cl:cons ':tail_end_enable (tail_end_enable msg))
    (cl:cons ':rm_plus_base_enable (rm_plus_base_enable msg))
    (cl:cons ':rm_plus_state_enable (rm_plus_state_enable msg))
))
