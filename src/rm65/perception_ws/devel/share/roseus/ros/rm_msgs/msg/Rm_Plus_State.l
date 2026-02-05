;; Auto-generated. Do not edit!


(when (boundp 'rm_msgs::Rm_Plus_State)
  (if (not (find-package "RM_MSGS"))
    (make-package "RM_MSGS"))
  (shadow 'Rm_Plus_State (find-package "RM_MSGS")))
(unless (find-package "RM_MSGS::RM_PLUS_STATE")
  (make-package "RM_MSGS::RM_PLUS_STATE"))

(in-package "ROS")
;;//! \htmlinclude Rm_Plus_State.msg.html


(defclass rm_msgs::Rm_Plus_State
  :super ros::object
  :slots (_sys_state _sys_err _dof_state _dof_err _pos _speed _angle _current _normal_force _tangential_force _tangential_force_dir _tsa _tma _touch_data _force ))

(defmethod rm_msgs::Rm_Plus_State
  (:init
   (&key
    ((:sys_state __sys_state) 0)
    ((:sys_err __sys_err) 0)
    ((:dof_state __dof_state) (make-array 0 :initial-element 0 :element-type :integer))
    ((:dof_err __dof_err) (make-array 0 :initial-element 0 :element-type :integer))
    ((:pos __pos) (make-array 0 :initial-element 0 :element-type :integer))
    ((:speed __speed) (make-array 0 :initial-element 0 :element-type :integer))
    ((:angle __angle) (make-array 0 :initial-element 0 :element-type :integer))
    ((:current __current) (make-array 0 :initial-element 0 :element-type :integer))
    ((:normal_force __normal_force) (make-array 0 :initial-element 0 :element-type :integer))
    ((:tangential_force __tangential_force) (make-array 0 :initial-element 0 :element-type :integer))
    ((:tangential_force_dir __tangential_force_dir) (make-array 0 :initial-element 0 :element-type :integer))
    ((:tsa __tsa) (make-array 0 :initial-element 0 :element-type :integer))
    ((:tma __tma) (make-array 0 :initial-element 0 :element-type :integer))
    ((:touch_data __touch_data) (make-array 0 :initial-element 0 :element-type :integer))
    ((:force __force) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _sys_state (round __sys_state))
   (setq _sys_err (round __sys_err))
   (setq _dof_state __dof_state)
   (setq _dof_err __dof_err)
   (setq _pos __pos)
   (setq _speed __speed)
   (setq _angle __angle)
   (setq _current __current)
   (setq _normal_force __normal_force)
   (setq _tangential_force __tangential_force)
   (setq _tangential_force_dir __tangential_force_dir)
   (setq _tsa __tsa)
   (setq _tma __tma)
   (setq _touch_data __touch_data)
   (setq _force __force)
   self)
  (:sys_state
   (&optional __sys_state)
   (if __sys_state (setq _sys_state __sys_state)) _sys_state)
  (:sys_err
   (&optional __sys_err)
   (if __sys_err (setq _sys_err __sys_err)) _sys_err)
  (:dof_state
   (&optional __dof_state)
   (if __dof_state (setq _dof_state __dof_state)) _dof_state)
  (:dof_err
   (&optional __dof_err)
   (if __dof_err (setq _dof_err __dof_err)) _dof_err)
  (:pos
   (&optional __pos)
   (if __pos (setq _pos __pos)) _pos)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:current
   (&optional __current)
   (if __current (setq _current __current)) _current)
  (:normal_force
   (&optional __normal_force)
   (if __normal_force (setq _normal_force __normal_force)) _normal_force)
  (:tangential_force
   (&optional __tangential_force)
   (if __tangential_force (setq _tangential_force __tangential_force)) _tangential_force)
  (:tangential_force_dir
   (&optional __tangential_force_dir)
   (if __tangential_force_dir (setq _tangential_force_dir __tangential_force_dir)) _tangential_force_dir)
  (:tsa
   (&optional __tsa)
   (if __tsa (setq _tsa __tsa)) _tsa)
  (:tma
   (&optional __tma)
   (if __tma (setq _tma __tma)) _tma)
  (:touch_data
   (&optional __touch_data)
   (if __touch_data (setq _touch_data __touch_data)) _touch_data)
  (:force
   (&optional __force)
   (if __force (setq _force __force)) _force)
  (:serialization-length
   ()
   (+
    ;; int32 _sys_state
    4
    ;; int32 _sys_err
    4
    ;; int32[] _dof_state
    (* 4    (length _dof_state)) 4
    ;; int32[] _dof_err
    (* 4    (length _dof_err)) 4
    ;; int32[] _pos
    (* 4    (length _pos)) 4
    ;; int32[] _speed
    (* 4    (length _speed)) 4
    ;; int32[] _angle
    (* 4    (length _angle)) 4
    ;; int32[] _current
    (* 4    (length _current)) 4
    ;; int32[] _normal_force
    (* 4    (length _normal_force)) 4
    ;; int32[] _tangential_force
    (* 4    (length _tangential_force)) 4
    ;; int32[] _tangential_force_dir
    (* 4    (length _tangential_force_dir)) 4
    ;; uint32[] _tsa
    (* 4    (length _tsa)) 4
    ;; uint32[] _tma
    (* 4    (length _tma)) 4
    ;; int32[] _touch_data
    (* 4    (length _touch_data)) 4
    ;; int32[] _force
    (* 4    (length _force)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _sys_state
       (write-long _sys_state s)
     ;; int32 _sys_err
       (write-long _sys_err s)
     ;; int32[] _dof_state
     (write-long (length _dof_state) s)
     (dotimes (i (length _dof_state))
       (write-long (elt _dof_state i) s)
       )
     ;; int32[] _dof_err
     (write-long (length _dof_err) s)
     (dotimes (i (length _dof_err))
       (write-long (elt _dof_err i) s)
       )
     ;; int32[] _pos
     (write-long (length _pos) s)
     (dotimes (i (length _pos))
       (write-long (elt _pos i) s)
       )
     ;; int32[] _speed
     (write-long (length _speed) s)
     (dotimes (i (length _speed))
       (write-long (elt _speed i) s)
       )
     ;; int32[] _angle
     (write-long (length _angle) s)
     (dotimes (i (length _angle))
       (write-long (elt _angle i) s)
       )
     ;; int32[] _current
     (write-long (length _current) s)
     (dotimes (i (length _current))
       (write-long (elt _current i) s)
       )
     ;; int32[] _normal_force
     (write-long (length _normal_force) s)
     (dotimes (i (length _normal_force))
       (write-long (elt _normal_force i) s)
       )
     ;; int32[] _tangential_force
     (write-long (length _tangential_force) s)
     (dotimes (i (length _tangential_force))
       (write-long (elt _tangential_force i) s)
       )
     ;; int32[] _tangential_force_dir
     (write-long (length _tangential_force_dir) s)
     (dotimes (i (length _tangential_force_dir))
       (write-long (elt _tangential_force_dir i) s)
       )
     ;; uint32[] _tsa
     (write-long (length _tsa) s)
     (dotimes (i (length _tsa))
       (write-long (elt _tsa i) s)
       )
     ;; uint32[] _tma
     (write-long (length _tma) s)
     (dotimes (i (length _tma))
       (write-long (elt _tma i) s)
       )
     ;; int32[] _touch_data
     (write-long (length _touch_data) s)
     (dotimes (i (length _touch_data))
       (write-long (elt _touch_data i) s)
       )
     ;; int32[] _force
     (write-long (length _force) s)
     (dotimes (i (length _force))
       (write-long (elt _force i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _sys_state
     (setq _sys_state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _sys_err
     (setq _sys_err (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32[] _dof_state
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _dof_state (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _dof_state i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _dof_err
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _dof_err (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _dof_err i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _pos
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pos (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _pos i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _speed
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _speed (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _speed i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _angle
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _angle (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _angle i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _current
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _current (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _current i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _normal_force
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _normal_force (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _normal_force i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _tangential_force
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _tangential_force (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _tangential_force i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _tangential_force_dir
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _tangential_force_dir (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _tangential_force_dir i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; uint32[] _tsa
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _tsa (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _tsa i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; uint32[] _tma
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _tma (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _tma i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _touch_data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _touch_data (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _touch_data i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _force
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _force (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _force i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get rm_msgs::Rm_Plus_State :md5sum-) "decaf5adc4942742a6b89965c207ee54")
(setf (get rm_msgs::Rm_Plus_State :datatype-) "rm_msgs/Rm_Plus_State")
(setf (get rm_msgs::Rm_Plus_State :definition-)
      "int32 sys_state                 #系统状态
int32 sys_err                   #系统错误
int32[] dof_state               #各自由度当前状态
int32[] dof_err                 #各自由度错误信息
int32[] pos                     #各自由度当前位置
int32[] speed                   #各自由度当前速度
int32[] angle                   #各自由度当前角度
int32[] current                 #各自由度当前电流
int32[] normal_force            #自由度触觉三维力的法向力
int32[] tangential_force        #自由度触觉三维力的切向力
int32[] tangential_force_dir    #自由度触觉三维力的切向力方向
uint32[] tsa                    #自由度触觉自接近
uint32[] tma                    #自由度触觉互接近
int32[] touch_data              #触觉传感器原始数据
int32[] force                   #自由度力矩
")



(provide :rm_msgs/Rm_Plus_State "decaf5adc4942742a6b89965c207ee54")


