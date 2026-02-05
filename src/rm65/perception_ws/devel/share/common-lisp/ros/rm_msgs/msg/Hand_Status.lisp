; Auto-generated. Do not edit!


(cl:in-package rm_msgs-msg)


;//! \htmlinclude Hand_Status.msg.html

(cl:defclass <Hand_Status> (roslisp-msg-protocol:ros-message)
  ((hand_angle
    :reader hand_angle
    :initarg :hand_angle
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 6 :element-type 'cl:fixnum :initial-element 0))
   (hand_pos
    :reader hand_pos
    :initarg :hand_pos
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 6 :element-type 'cl:fixnum :initial-element 0))
   (hand_state
    :reader hand_state
    :initarg :hand_state
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 6 :element-type 'cl:fixnum :initial-element 0))
   (hand_force
    :reader hand_force
    :initarg :hand_force
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 6 :element-type 'cl:fixnum :initial-element 0))
   (hand_err
    :reader hand_err
    :initarg :hand_err
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Hand_Status (<Hand_Status>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Hand_Status>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Hand_Status)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rm_msgs-msg:<Hand_Status> is deprecated: use rm_msgs-msg:Hand_Status instead.")))

(cl:ensure-generic-function 'hand_angle-val :lambda-list '(m))
(cl:defmethod hand_angle-val ((m <Hand_Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:hand_angle-val is deprecated.  Use rm_msgs-msg:hand_angle instead.")
  (hand_angle m))

(cl:ensure-generic-function 'hand_pos-val :lambda-list '(m))
(cl:defmethod hand_pos-val ((m <Hand_Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:hand_pos-val is deprecated.  Use rm_msgs-msg:hand_pos instead.")
  (hand_pos m))

(cl:ensure-generic-function 'hand_state-val :lambda-list '(m))
(cl:defmethod hand_state-val ((m <Hand_Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:hand_state-val is deprecated.  Use rm_msgs-msg:hand_state instead.")
  (hand_state m))

(cl:ensure-generic-function 'hand_force-val :lambda-list '(m))
(cl:defmethod hand_force-val ((m <Hand_Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:hand_force-val is deprecated.  Use rm_msgs-msg:hand_force instead.")
  (hand_force m))

(cl:ensure-generic-function 'hand_err-val :lambda-list '(m))
(cl:defmethod hand_err-val ((m <Hand_Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:hand_err-val is deprecated.  Use rm_msgs-msg:hand_err instead.")
  (hand_err m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Hand_Status>) ostream)
  "Serializes a message object of type '<Hand_Status>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'hand_angle))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'hand_pos))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'hand_state))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'hand_force))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hand_err)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'hand_err)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Hand_Status>) istream)
  "Deserializes a message object of type '<Hand_Status>"
  (cl:setf (cl:slot-value msg 'hand_angle) (cl:make-array 6))
  (cl:let ((vals (cl:slot-value msg 'hand_angle)))
    (cl:dotimes (i 6)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))))
  (cl:setf (cl:slot-value msg 'hand_pos) (cl:make-array 6))
  (cl:let ((vals (cl:slot-value msg 'hand_pos)))
    (cl:dotimes (i 6)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))))
  (cl:setf (cl:slot-value msg 'hand_state) (cl:make-array 6))
  (cl:let ((vals (cl:slot-value msg 'hand_state)))
    (cl:dotimes (i 6)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))))
  (cl:setf (cl:slot-value msg 'hand_force) (cl:make-array 6))
  (cl:let ((vals (cl:slot-value msg 'hand_force)))
    (cl:dotimes (i 6)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hand_err)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'hand_err)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Hand_Status>)))
  "Returns string type for a message object of type '<Hand_Status>"
  "rm_msgs/Hand_Status")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Hand_Status)))
  "Returns string type for a message object of type 'Hand_Status"
  "rm_msgs/Hand_Status")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Hand_Status>)))
  "Returns md5sum for a message object of type '<Hand_Status>"
  "1cce752e69bf0b22631007e9bc8d2458")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Hand_Status)))
  "Returns md5sum for a message object of type 'Hand_Status"
  "1cce752e69bf0b22631007e9bc8d2458")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Hand_Status>)))
  "Returns full string definition for message of type '<Hand_Status>"
  (cl:format cl:nil "#灵巧手上报状态~%~%uint16[6] hand_angle	#手指角度数组，范围：0~~2000.~%uint16[6] hand_pos	#手指位置数组，范围：0~~1000.~%uint16[6] hand_state	#手指状态,0正在松开，1正在抓取，2位置到位停止，3力到位停止，5电流保护停止，6电缸堵转停止，7电缸故障停止~%uint16[6] hand_force    #灵巧手自由度电流，单位mN~%uint16  hand_err          #灵巧手系统错误，1表示有错误，0表示无错误~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Hand_Status)))
  "Returns full string definition for message of type 'Hand_Status"
  (cl:format cl:nil "#灵巧手上报状态~%~%uint16[6] hand_angle	#手指角度数组，范围：0~~2000.~%uint16[6] hand_pos	#手指位置数组，范围：0~~1000.~%uint16[6] hand_state	#手指状态,0正在松开，1正在抓取，2位置到位停止，3力到位停止，5电流保护停止，6电缸堵转停止，7电缸故障停止~%uint16[6] hand_force    #灵巧手自由度电流，单位mN~%uint16  hand_err          #灵巧手系统错误，1表示有错误，0表示无错误~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Hand_Status>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'hand_angle) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'hand_pos) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'hand_state) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'hand_force) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Hand_Status>))
  "Converts a ROS message object to a list"
  (cl:list 'Hand_Status
    (cl:cons ':hand_angle (hand_angle msg))
    (cl:cons ':hand_pos (hand_pos msg))
    (cl:cons ':hand_state (hand_state msg))
    (cl:cons ':hand_force (hand_force msg))
    (cl:cons ':hand_err (hand_err msg))
))
