; Auto-generated. Do not edit!


(cl:in-package rm_msgs-msg)


;//! \htmlinclude Lift_In_Position.msg.html

(cl:defclass <Lift_In_Position> (roslisp-msg-protocol:ros-message)
  ((device
    :reader device
    :initarg :device
    :type cl:fixnum
    :initform 0)
   (state
    :reader state
    :initarg :state
    :type cl:string
    :initform "")
   (trajectory_connect
    :reader trajectory_connect
    :initarg :trajectory_connect
    :type cl:fixnum
    :initform 0)
   (trajectory_state
    :reader trajectory_state
    :initarg :trajectory_state
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Lift_In_Position (<Lift_In_Position>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Lift_In_Position>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Lift_In_Position)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rm_msgs-msg:<Lift_In_Position> is deprecated: use rm_msgs-msg:Lift_In_Position instead.")))

(cl:ensure-generic-function 'device-val :lambda-list '(m))
(cl:defmethod device-val ((m <Lift_In_Position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:device-val is deprecated.  Use rm_msgs-msg:device instead.")
  (device m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <Lift_In_Position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:state-val is deprecated.  Use rm_msgs-msg:state instead.")
  (state m))

(cl:ensure-generic-function 'trajectory_connect-val :lambda-list '(m))
(cl:defmethod trajectory_connect-val ((m <Lift_In_Position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:trajectory_connect-val is deprecated.  Use rm_msgs-msg:trajectory_connect instead.")
  (trajectory_connect m))

(cl:ensure-generic-function 'trajectory_state-val :lambda-list '(m))
(cl:defmethod trajectory_state-val ((m <Lift_In_Position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:trajectory_state-val is deprecated.  Use rm_msgs-msg:trajectory_state instead.")
  (trajectory_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Lift_In_Position>) ostream)
  "Serializes a message object of type '<Lift_In_Position>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'device)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'state))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'state))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'trajectory_connect)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'trajectory_state) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Lift_In_Position>) istream)
  "Deserializes a message object of type '<Lift_In_Position>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'device)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'state) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'state) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'trajectory_connect)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'trajectory_state) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Lift_In_Position>)))
  "Returns string type for a message object of type '<Lift_In_Position>"
  "rm_msgs/Lift_In_Position")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Lift_In_Position)))
  "Returns string type for a message object of type 'Lift_In_Position"
  "rm_msgs/Lift_In_Position")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Lift_In_Position>)))
  "Returns md5sum for a message object of type '<Lift_In_Position>"
  "8560798487e4b58bf325a3d3d0cad027")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Lift_In_Position)))
  "Returns md5sum for a message object of type 'Lift_In_Position"
  "8560798487e4b58bf325a3d3d0cad027")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Lift_In_Position>)))
  "Returns full string definition for message of type '<Lift_In_Position>"
  (cl:format cl:nil "uint8 device~%string state~%uint8 trajectory_connect~%bool trajectory_state~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Lift_In_Position)))
  "Returns full string definition for message of type 'Lift_In_Position"
  (cl:format cl:nil "uint8 device~%string state~%uint8 trajectory_connect~%bool trajectory_state~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Lift_In_Position>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'state))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Lift_In_Position>))
  "Converts a ROS message object to a list"
  (cl:list 'Lift_In_Position
    (cl:cons ':device (device msg))
    (cl:cons ':state (state msg))
    (cl:cons ':trajectory_connect (trajectory_connect msg))
    (cl:cons ':trajectory_state (trajectory_state msg))
))
