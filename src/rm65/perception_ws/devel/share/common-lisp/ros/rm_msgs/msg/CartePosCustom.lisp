; Auto-generated. Do not edit!


(cl:in-package rm_msgs-msg)


;//! \htmlinclude CartePosCustom.msg.html

(cl:defclass <CartePosCustom> (roslisp-msg-protocol:ros-message)
  ((Pose
    :reader Pose
    :initarg :Pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
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

(cl:defclass CartePosCustom (<CartePosCustom>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CartePosCustom>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CartePosCustom)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rm_msgs-msg:<CartePosCustom> is deprecated: use rm_msgs-msg:CartePosCustom instead.")))

(cl:ensure-generic-function 'Pose-val :lambda-list '(m))
(cl:defmethod Pose-val ((m <CartePosCustom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:Pose-val is deprecated.  Use rm_msgs-msg:Pose instead.")
  (Pose m))

(cl:ensure-generic-function 'follow-val :lambda-list '(m))
(cl:defmethod follow-val ((m <CartePosCustom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:follow-val is deprecated.  Use rm_msgs-msg:follow instead.")
  (follow m))

(cl:ensure-generic-function 'trajectory_mode-val :lambda-list '(m))
(cl:defmethod trajectory_mode-val ((m <CartePosCustom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:trajectory_mode-val is deprecated.  Use rm_msgs-msg:trajectory_mode instead.")
  (trajectory_mode m))

(cl:ensure-generic-function 'radio-val :lambda-list '(m))
(cl:defmethod radio-val ((m <CartePosCustom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:radio-val is deprecated.  Use rm_msgs-msg:radio instead.")
  (radio m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CartePosCustom>) ostream)
  "Serializes a message object of type '<CartePosCustom>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Pose) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'follow) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'trajectory_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radio)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CartePosCustom>) istream)
  "Deserializes a message object of type '<CartePosCustom>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Pose) istream)
    (cl:setf (cl:slot-value msg 'follow) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'trajectory_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radio)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CartePosCustom>)))
  "Returns string type for a message object of type '<CartePosCustom>"
  "rm_msgs/CartePosCustom")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CartePosCustom)))
  "Returns string type for a message object of type 'CartePosCustom"
  "rm_msgs/CartePosCustom")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CartePosCustom>)))
  "Returns md5sum for a message object of type '<CartePosCustom>"
  "af7ee1edb545e20ac1d00c5aeafad8b0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CartePosCustom)))
  "Returns md5sum for a message object of type 'CartePosCustom"
  "af7ee1edb545e20ac1d00c5aeafad8b0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CartePosCustom>)))
  "Returns full string definition for message of type '<CartePosCustom>"
  (cl:format cl:nil "geometry_msgs/Pose Pose~%bool follow~%uint8 trajectory_mode~%uint8 radio~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CartePosCustom)))
  "Returns full string definition for message of type 'CartePosCustom"
  (cl:format cl:nil "geometry_msgs/Pose Pose~%bool follow~%uint8 trajectory_mode~%uint8 radio~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CartePosCustom>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Pose))
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CartePosCustom>))
  "Converts a ROS message object to a list"
  (cl:list 'CartePosCustom
    (cl:cons ':Pose (Pose msg))
    (cl:cons ':follow (follow msg))
    (cl:cons ':trajectory_mode (trajectory_mode msg))
    (cl:cons ':radio (radio msg))
))
