; Auto-generated. Do not edit!


(cl:in-package rm_msgs-msg)


;//! \htmlinclude Rm_Plus_Base.msg.html

(cl:defclass <Rm_Plus_Base> (roslisp-msg-protocol:ros-message)
  ((manu
    :reader manu
    :initarg :manu
    :type cl:string
    :initform "")
   (type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0)
   (hv
    :reader hv
    :initarg :hv
    :type cl:string
    :initform "")
   (sv
    :reader sv
    :initarg :sv
    :type cl:string
    :initform "")
   (bv
    :reader bv
    :initarg :bv
    :type cl:string
    :initform "")
   (id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (dof
    :reader dof
    :initarg :dof
    :type cl:fixnum
    :initform 0)
   (check
    :reader check
    :initarg :check
    :type cl:fixnum
    :initform 0)
   (bee
    :reader bee
    :initarg :bee
    :type cl:fixnum
    :initform 0)
   (force
    :reader force
    :initarg :force
    :type cl:boolean
    :initform cl:nil)
   (touch
    :reader touch
    :initarg :touch
    :type cl:boolean
    :initform cl:nil)
   (touch_num
    :reader touch_num
    :initarg :touch_num
    :type cl:fixnum
    :initform 0)
   (touch_sw
    :reader touch_sw
    :initarg :touch_sw
    :type cl:fixnum
    :initform 0)
   (hand
    :reader hand
    :initarg :hand
    :type cl:fixnum
    :initform 0)
   (pos_up
    :reader pos_up
    :initarg :pos_up
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (pos_low
    :reader pos_low
    :initarg :pos_low
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (angle_up
    :reader angle_up
    :initarg :angle_up
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (angle_low
    :reader angle_low
    :initarg :angle_low
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (speed_up
    :reader speed_up
    :initarg :speed_up
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (speed_low
    :reader speed_low
    :initarg :speed_low
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (force_up
    :reader force_up
    :initarg :force_up
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (force_low
    :reader force_low
    :initarg :force_low
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass Rm_Plus_Base (<Rm_Plus_Base>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Rm_Plus_Base>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Rm_Plus_Base)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rm_msgs-msg:<Rm_Plus_Base> is deprecated: use rm_msgs-msg:Rm_Plus_Base instead.")))

(cl:ensure-generic-function 'manu-val :lambda-list '(m))
(cl:defmethod manu-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:manu-val is deprecated.  Use rm_msgs-msg:manu instead.")
  (manu m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:type-val is deprecated.  Use rm_msgs-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'hv-val :lambda-list '(m))
(cl:defmethod hv-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:hv-val is deprecated.  Use rm_msgs-msg:hv instead.")
  (hv m))

(cl:ensure-generic-function 'sv-val :lambda-list '(m))
(cl:defmethod sv-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:sv-val is deprecated.  Use rm_msgs-msg:sv instead.")
  (sv m))

(cl:ensure-generic-function 'bv-val :lambda-list '(m))
(cl:defmethod bv-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:bv-val is deprecated.  Use rm_msgs-msg:bv instead.")
  (bv m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:id-val is deprecated.  Use rm_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'dof-val :lambda-list '(m))
(cl:defmethod dof-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:dof-val is deprecated.  Use rm_msgs-msg:dof instead.")
  (dof m))

(cl:ensure-generic-function 'check-val :lambda-list '(m))
(cl:defmethod check-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:check-val is deprecated.  Use rm_msgs-msg:check instead.")
  (check m))

(cl:ensure-generic-function 'bee-val :lambda-list '(m))
(cl:defmethod bee-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:bee-val is deprecated.  Use rm_msgs-msg:bee instead.")
  (bee m))

(cl:ensure-generic-function 'force-val :lambda-list '(m))
(cl:defmethod force-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:force-val is deprecated.  Use rm_msgs-msg:force instead.")
  (force m))

(cl:ensure-generic-function 'touch-val :lambda-list '(m))
(cl:defmethod touch-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:touch-val is deprecated.  Use rm_msgs-msg:touch instead.")
  (touch m))

(cl:ensure-generic-function 'touch_num-val :lambda-list '(m))
(cl:defmethod touch_num-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:touch_num-val is deprecated.  Use rm_msgs-msg:touch_num instead.")
  (touch_num m))

(cl:ensure-generic-function 'touch_sw-val :lambda-list '(m))
(cl:defmethod touch_sw-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:touch_sw-val is deprecated.  Use rm_msgs-msg:touch_sw instead.")
  (touch_sw m))

(cl:ensure-generic-function 'hand-val :lambda-list '(m))
(cl:defmethod hand-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:hand-val is deprecated.  Use rm_msgs-msg:hand instead.")
  (hand m))

(cl:ensure-generic-function 'pos_up-val :lambda-list '(m))
(cl:defmethod pos_up-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:pos_up-val is deprecated.  Use rm_msgs-msg:pos_up instead.")
  (pos_up m))

(cl:ensure-generic-function 'pos_low-val :lambda-list '(m))
(cl:defmethod pos_low-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:pos_low-val is deprecated.  Use rm_msgs-msg:pos_low instead.")
  (pos_low m))

(cl:ensure-generic-function 'angle_up-val :lambda-list '(m))
(cl:defmethod angle_up-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:angle_up-val is deprecated.  Use rm_msgs-msg:angle_up instead.")
  (angle_up m))

(cl:ensure-generic-function 'angle_low-val :lambda-list '(m))
(cl:defmethod angle_low-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:angle_low-val is deprecated.  Use rm_msgs-msg:angle_low instead.")
  (angle_low m))

(cl:ensure-generic-function 'speed_up-val :lambda-list '(m))
(cl:defmethod speed_up-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:speed_up-val is deprecated.  Use rm_msgs-msg:speed_up instead.")
  (speed_up m))

(cl:ensure-generic-function 'speed_low-val :lambda-list '(m))
(cl:defmethod speed_low-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:speed_low-val is deprecated.  Use rm_msgs-msg:speed_low instead.")
  (speed_low m))

(cl:ensure-generic-function 'force_up-val :lambda-list '(m))
(cl:defmethod force_up-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:force_up-val is deprecated.  Use rm_msgs-msg:force_up instead.")
  (force_up m))

(cl:ensure-generic-function 'force_low-val :lambda-list '(m))
(cl:defmethod force_low-val ((m <Rm_Plus_Base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rm_msgs-msg:force_low-val is deprecated.  Use rm_msgs-msg:force_low instead.")
  (force_low m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Rm_Plus_Base>) ostream)
  "Serializes a message object of type '<Rm_Plus_Base>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'manu))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'manu))
  (cl:let* ((signed (cl:slot-value msg 'type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'hv))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'hv))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'sv))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'sv))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'bv))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'bv))
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'dof)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'check)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'bee)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'force) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'touch) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'touch_num)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'touch_sw)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'hand)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pos_up))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'pos_up))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pos_low))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'pos_low))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'angle_up))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'angle_up))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'angle_low))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'angle_low))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'speed_up))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'speed_up))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'speed_low))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'speed_low))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'force_up))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'force_up))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'force_low))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'force_low))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Rm_Plus_Base>) istream)
  "Deserializes a message object of type '<Rm_Plus_Base>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'manu) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'manu) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'hv) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'hv) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sv) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'sv) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'bv) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'bv) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dof) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'check) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'bee) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:slot-value msg 'force) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'touch) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'touch_num) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'touch_sw) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'hand) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pos_up) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pos_up)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pos_low) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pos_low)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'angle_up) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'angle_up)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'angle_low) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'angle_low)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'speed_up) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'speed_up)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'speed_low) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'speed_low)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'force_up) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'force_up)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'force_low) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'force_low)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Rm_Plus_Base>)))
  "Returns string type for a message object of type '<Rm_Plus_Base>"
  "rm_msgs/Rm_Plus_Base")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Rm_Plus_Base)))
  "Returns string type for a message object of type 'Rm_Plus_Base"
  "rm_msgs/Rm_Plus_Base")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Rm_Plus_Base>)))
  "Returns md5sum for a message object of type '<Rm_Plus_Base>"
  "6811b6d3be27919dd94cf28267ef3a90")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Rm_Plus_Base)))
  "Returns md5sum for a message object of type 'Rm_Plus_Base"
  "6811b6d3be27919dd94cf28267ef3a90")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Rm_Plus_Base>)))
  "Returns full string definition for message of type '<Rm_Plus_Base>"
  (cl:format cl:nil "string manu              # 设备厂家~%int8 type                # 设备类型 1：两指夹爪 2：五指灵巧手 3：三指夹爪~%string hv                # 硬件版本~%string sv                # 软件版本~%string bv                # boot版本~%int32 id                 # 设备ID~%int8 dof                 # 自由度~%int8 check               # 自检开关~%int8 bee                 # 蜂鸣器开关~%bool force               # 力控支持~%bool touch               # 触觉支持~%int8 touch_num           # 触觉个数~%int8 touch_sw            # 触觉开关~%int8 hand                # 手方向 1 ：左手 2： 右手~%int32[] pos_up           # 位置上限,单位：无量纲~%int32[] pos_low          # 位置下限,单位：无量纲~%int32[] angle_up         # 角度上限,单位：0.01度~%int32[] angle_low        # 角度下限,单位：0.01度~%int32[] speed_up         # 速度上限,单位：无量纲~%int32[] speed_low        # 速度下限,单位：无量纲~%int32[] force_up         # 力上限,单位：0.001N ~%int32[] force_low        # 力下限,单位：0.001N ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Rm_Plus_Base)))
  "Returns full string definition for message of type 'Rm_Plus_Base"
  (cl:format cl:nil "string manu              # 设备厂家~%int8 type                # 设备类型 1：两指夹爪 2：五指灵巧手 3：三指夹爪~%string hv                # 硬件版本~%string sv                # 软件版本~%string bv                # boot版本~%int32 id                 # 设备ID~%int8 dof                 # 自由度~%int8 check               # 自检开关~%int8 bee                 # 蜂鸣器开关~%bool force               # 力控支持~%bool touch               # 触觉支持~%int8 touch_num           # 触觉个数~%int8 touch_sw            # 触觉开关~%int8 hand                # 手方向 1 ：左手 2： 右手~%int32[] pos_up           # 位置上限,单位：无量纲~%int32[] pos_low          # 位置下限,单位：无量纲~%int32[] angle_up         # 角度上限,单位：0.01度~%int32[] angle_low        # 角度下限,单位：0.01度~%int32[] speed_up         # 速度上限,单位：无量纲~%int32[] speed_low        # 速度下限,单位：无量纲~%int32[] force_up         # 力上限,单位：0.001N ~%int32[] force_low        # 力下限,单位：0.001N ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Rm_Plus_Base>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'manu))
     1
     4 (cl:length (cl:slot-value msg 'hv))
     4 (cl:length (cl:slot-value msg 'sv))
     4 (cl:length (cl:slot-value msg 'bv))
     4
     1
     1
     1
     1
     1
     1
     1
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pos_up) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pos_low) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'angle_up) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'angle_low) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'speed_up) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'speed_low) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'force_up) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'force_low) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Rm_Plus_Base>))
  "Converts a ROS message object to a list"
  (cl:list 'Rm_Plus_Base
    (cl:cons ':manu (manu msg))
    (cl:cons ':type (type msg))
    (cl:cons ':hv (hv msg))
    (cl:cons ':sv (sv msg))
    (cl:cons ':bv (bv msg))
    (cl:cons ':id (id msg))
    (cl:cons ':dof (dof msg))
    (cl:cons ':check (check msg))
    (cl:cons ':bee (bee msg))
    (cl:cons ':force (force msg))
    (cl:cons ':touch (touch msg))
    (cl:cons ':touch_num (touch_num msg))
    (cl:cons ':touch_sw (touch_sw msg))
    (cl:cons ':hand (hand msg))
    (cl:cons ':pos_up (pos_up msg))
    (cl:cons ':pos_low (pos_low msg))
    (cl:cons ':angle_up (angle_up msg))
    (cl:cons ':angle_low (angle_low msg))
    (cl:cons ':speed_up (speed_up msg))
    (cl:cons ':speed_low (speed_low msg))
    (cl:cons ':force_up (force_up msg))
    (cl:cons ':force_low (force_low msg))
))
