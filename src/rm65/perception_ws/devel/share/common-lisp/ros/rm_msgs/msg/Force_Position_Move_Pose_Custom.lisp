; Auto-generated. Do not edit!


(cl:in-package rm_msgs-msg)


;//! \htmlinclude Force_Position_Move_Pose_Custom.msg.html

(cl:defclass <Force_Position_Move_Pose_Custom> (roslisp-msg-protocol:ros-message)
  ((Pose
    :reader Pose
    :initarg :Pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (sensor
    :reader sensor
    :initarg :sensor
    :type cl:fixnum
    :initform 0)
   (mode
    :reader mode
    :initarg :mode
    :type cl:fixnum
    :initform 0)
   (dir
    :reader dir
    :initarg :dir
    :type cl:fixnum
    :initform 0)
   (force
    :reader force
    :initarg :force
    :type cl:fixnum
    :initform 0)
   (follow
    :reader follow
    :initarg :follow
    :type cl:boolean
    :initform cl:nil)
   (trajectory_mode
    :reader trajectory_mode
    :initarg :trajectory_mode
    :type cl:fixnum
    :initform 0)
   (radio
    :reader radio
    :initarg :radio
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Force_Position_Move_Pose_Custom (<Force_Position_Move_Pose_Custom>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Force_Position_Move_Pose_Custom>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Force_Position_Move_Pose_Custom)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rm_msgs-msg:<Force_Position_Move_Pose_Custom> is deprecated: use rm_msgs-msg:Force_Position_Move_Pose_Custom instead.")))

(cl:ensure-generic-function 'Pose-val :lambda-list '(m))
(cl:defmethod Pose-val ((m <Force_Position_Move_Pose_Custom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:Pose-val is deprecated.  Use rm_msgs-msg:Pose instead.")
  (Pose m))

(cl:ensure-generic-function 'sensor-val :lambda-list '(m))
(cl:defmethod sensor-val ((m <Force_Position_Move_Pose_Custom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:sensor-val is deprecated.  Use rm_msgs-msg:sensor instead.")
  (sensor m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <Force_Position_Move_Pose_Custom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:mode-val is deprecated.  Use rm_msgs-msg:mode instead.")
  (mode m))

(cl:ensure-generic-function 'dir-val :lambda-list '(m))
(cl:defmethod dir-val ((m <Force_Position_Move_Pose_Custom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:dir-val is deprecated.  Use rm_msgs-msg:dir instead.")
  (dir m))

(cl:ensure-generic-function 'force-val :lambda-list '(m))
(cl:defmethod force-val ((m <Force_Position_Move_Pose_Custom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:force-val is deprecated.  Use rm_msgs-msg:force instead.")
  (force m))

(cl:ensure-generic-function 'follow-val :lambda-list '(m))
(cl:defmethod follow-val ((m <Force_Position_Move_Pose_Custom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:follow-val is deprecated.  Use rm_msgs-msg:follow instead.")
  (follow m))

(cl:ensure-generic-function 'trajectory_mode-val :lambda-list '(m))
(cl:defmethod trajectory_mode-val ((m <Force_Position_Move_Pose_Custom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:trajectory_mode-val is deprecated.  Use rm_msgs-msg:trajectory_mode instead.")
  (trajectory_mode m))

(cl:ensure-generic-function 'radio-val :lambda-list '(m))
(cl:defmethod radio-val ((m <Force_Position_Move_Pose_Custom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:radio-val is deprecated.  Use rm_msgs-msg:radio instead.")
  (radio m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Force_Position_Move_Pose_Custom>) ostream)
  "Serializes a message object of type '<Force_Position_Move_Pose_Custom>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Pose) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensor)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dir)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'force)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'follow) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'trajectory_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radio)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Force_Position_Move_Pose_Custom>) istream)
  "Deserializes a message object of type '<Force_Position_Move_Pose_Custom>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Pose) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sensor)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'dir)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'force) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:setf (cl:slot-value msg 'follow) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'trajectory_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radio)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Force_Position_Move_Pose_Custom>)))
  "Returns string type for a message object of type '<Force_Position_Move_Pose_Custom>"
  "rm_msgs/Force_Position_Move_Pose_Custom")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Force_Position_Move_Pose_Custom)))
  "Returns string type for a message object of type 'Force_Position_Move_Pose_Custom"
  "rm_msgs/Force_Position_Move_Pose_Custom")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Force_Position_Move_Pose_Custom>)))
  "Returns md5sum for a message object of type '<Force_Position_Move_Pose_Custom>"
  "ba22909657b007c304f2b2ecbe12b041")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Force_Position_Move_Pose_Custom)))
  "Returns md5sum for a message object of type 'Force_Position_Move_Pose_Custom"
  "ba22909657b007c304f2b2ecbe12b041")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Force_Position_Move_Pose_Custom>)))
  "Returns full string definition for message of type '<Force_Position_Move_Pose_Custom>"
  (cl:format cl:nil "geometry_msgs/Pose Pose~%uint8 sensor~%uint8 mode~%uint8 dir~%int16 force~%bool follow~%uint8 trajectory_mode~%uint8 radio~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Force_Position_Move_Pose_Custom)))
  "Returns full string definition for message of type 'Force_Position_Move_Pose_Custom"
  (cl:format cl:nil "geometry_msgs/Pose Pose~%uint8 sensor~%uint8 mode~%uint8 dir~%int16 force~%bool follow~%uint8 trajectory_mode~%uint8 radio~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Force_Position_Move_Pose_Custom>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Pose))
     1
     1
     1
     2
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Force_Position_Move_Pose_Custom>))
  "Converts a ROS message object to a list"
  (cl:list 'Force_Position_Move_Pose_Custom
    (cl:cons ':Pose (Pose msg))
    (cl:cons ':sensor (sensor msg))
    (cl:cons ':mode (mode msg))
    (cl:cons ':dir (dir msg))
    (cl:cons ':force (force msg))
    (cl:cons ':follow (follow msg))
    (cl:cons ':trajectory_mode (trajectory_mode msg))
    (cl:cons ':radio (radio msg))
))
