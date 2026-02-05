; Auto-generated. Do not edit!


(cl:in-package rm_msgs-msg)


;//! \htmlinclude JointPosCustom.msg.html

(cl:defclass <JointPosCustom> (roslisp-msg-protocol:ros-message)
  ((joint
    :reader joint
    :initarg :joint
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (expand
    :reader expand
    :initarg :expand
    :type cl:float
    :initform 0.0)
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

(cl:defclass JointPosCustom (<JointPosCustom>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JointPosCustom>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JointPosCustom)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rm_msgs-msg:<JointPosCustom> is deprecated: use rm_msgs-msg:JointPosCustom instead.")))

(cl:ensure-generic-function 'joint-val :lambda-list '(m))
(cl:defmethod joint-val ((m <JointPosCustom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:joint-val is deprecated.  Use rm_msgs-msg:joint instead.")
  (joint m))

(cl:ensure-generic-function 'expand-val :lambda-list '(m))
(cl:defmethod expand-val ((m <JointPosCustom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:expand-val is deprecated.  Use rm_msgs-msg:expand instead.")
  (expand m))

(cl:ensure-generic-function 'follow-val :lambda-list '(m))
(cl:defmethod follow-val ((m <JointPosCustom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:follow-val is deprecated.  Use rm_msgs-msg:follow instead.")
  (follow m))

(cl:ensure-generic-function 'trajectory_mode-val :lambda-list '(m))
(cl:defmethod trajectory_mode-val ((m <JointPosCustom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:trajectory_mode-val is deprecated.  Use rm_msgs-msg:trajectory_mode instead.")
  (trajectory_mode m))

(cl:ensure-generic-function 'radio-val :lambda-list '(m))
(cl:defmethod radio-val ((m <JointPosCustom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:radio-val is deprecated.  Use rm_msgs-msg:radio instead.")
  (radio m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JointPosCustom>) ostream)
  "Serializes a message object of type '<JointPosCustom>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'joint))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'expand))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'follow) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'trajectory_mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radio)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JointPosCustom>) istream)
  "Deserializes a message object of type '<JointPosCustom>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'expand) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'follow) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'trajectory_mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'radio)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JointPosCustom>)))
  "Returns string type for a message object of type '<JointPosCustom>"
  "rm_msgs/JointPosCustom")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JointPosCustom)))
  "Returns string type for a message object of type 'JointPosCustom"
  "rm_msgs/JointPosCustom")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JointPosCustom>)))
  "Returns md5sum for a message object of type '<JointPosCustom>"
  "2953fc21da6104e47b8b6b70f74f1aee")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JointPosCustom)))
  "Returns md5sum for a message object of type 'JointPosCustom"
  "2953fc21da6104e47b8b6b70f74f1aee")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JointPosCustom>)))
  "Returns full string definition for message of type '<JointPosCustom>"
  (cl:format cl:nil "#control arm joints without planning~%~%float32[] joint~%float32    expand~%bool follow~%uint8 trajectory_mode~%uint8 radio~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JointPosCustom)))
  "Returns full string definition for message of type 'JointPosCustom"
  (cl:format cl:nil "#control arm joints without planning~%~%float32[] joint~%float32    expand~%bool follow~%uint8 trajectory_mode~%uint8 radio~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JointPosCustom>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JointPosCustom>))
  "Converts a ROS message object to a list"
  (cl:list 'JointPosCustom
    (cl:cons ':joint (joint msg))
    (cl:cons ':expand (expand msg))
    (cl:cons ':follow (follow msg))
    (cl:cons ':trajectory_mode (trajectory_mode msg))
    (cl:cons ':radio (radio msg))
))
