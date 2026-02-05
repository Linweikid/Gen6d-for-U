; Auto-generated. Do not edit!


(cl:in-package rm_msgs-msg)


;//! \htmlinclude Joint_PoseEuler.msg.html

(cl:defclass <Joint_PoseEuler> (roslisp-msg-protocol:ros-message)
  ((euler
    :reader euler
    :initarg :euler
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (position
    :reader position
    :initarg :position
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Joint_PoseEuler (<Joint_PoseEuler>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Joint_PoseEuler>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Joint_PoseEuler)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rm_msgs-msg:<Joint_PoseEuler> is deprecated: use rm_msgs-msg:Joint_PoseEuler instead.")))

(cl:ensure-generic-function 'euler-val :lambda-list '(m))
(cl:defmethod euler-val ((m <Joint_PoseEuler>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:euler-val is deprecated.  Use rm_msgs-msg:euler instead.")
  (euler m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <Joint_PoseEuler>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:position-val is deprecated.  Use rm_msgs-msg:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Joint_PoseEuler>) ostream)
  "Serializes a message object of type '<Joint_PoseEuler>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'euler))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'position))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Joint_PoseEuler>) istream)
  "Deserializes a message object of type '<Joint_PoseEuler>"
  (cl:setf (cl:slot-value msg 'euler) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'euler)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'position) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'position)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Joint_PoseEuler>)))
  "Returns string type for a message object of type '<Joint_PoseEuler>"
  "rm_msgs/Joint_PoseEuler")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Joint_PoseEuler)))
  "Returns string type for a message object of type 'Joint_PoseEuler"
  "rm_msgs/Joint_PoseEuler")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Joint_PoseEuler>)))
  "Returns md5sum for a message object of type '<Joint_PoseEuler>"
  "9254815d452fb49553cab1a1384a3e0a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Joint_PoseEuler)))
  "Returns md5sum for a message object of type 'Joint_PoseEuler"
  "9254815d452fb49553cab1a1384a3e0a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Joint_PoseEuler>)))
  "Returns full string definition for message of type '<Joint_PoseEuler>"
  (cl:format cl:nil "float32[3] euler~%float32[3] position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Joint_PoseEuler)))
  "Returns full string definition for message of type 'Joint_PoseEuler"
  (cl:format cl:nil "float32[3] euler~%float32[3] position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Joint_PoseEuler>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'euler) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Joint_PoseEuler>))
  "Converts a ROS message object to a list"
  (cl:list 'Joint_PoseEuler
    (cl:cons ':euler (euler msg))
    (cl:cons ':position (position msg))
))
