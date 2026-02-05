;; Auto-generated. Do not edit!


(when (boundp 'rm_msgs::Rm_Plus_Base)
  (if (not (find-package "RM_MSGS"))
    (make-package "RM_MSGS"))
  (shadow 'Rm_Plus_Base (find-package "RM_MSGS")))
(unless (find-package "RM_MSGS::RM_PLUS_BASE")
  (make-package "RM_MSGS::RM_PLUS_BASE"))

(in-package "ROS")
;;//! \htmlinclude Rm_Plus_Base.msg.html


(defclass rm_msgs::Rm_Plus_Base
  :super ros::object
  :slots (_manu _type _hv _sv _bv _id _dof _check _bee _force _touch _touch_num _touch_sw _hand _pos_up _pos_low _angle_up _angle_low _speed_up _speed_low _force_up _force_low ))

(defmethod rm_msgs::Rm_Plus_Base
  (:init
   (&key
    ((:manu __manu) "")
    ((:type __type) 0)
    ((:hv __hv) "")
    ((:sv __sv) "")
    ((:bv __bv) "")
    ((:id __id) 0)
    ((:dof __dof) 0)
    ((:check __check) 0)
    ((:bee __bee) 0)
    ((:force __force) nil)
    ((:touch __touch) nil)
    ((:touch_num __touch_num) 0)
    ((:touch_sw __touch_sw) 0)
    ((:hand __hand) 0)
    ((:pos_up __pos_up) (make-array 0 :initial-element 0 :element-type :integer))
    ((:pos_low __pos_low) (make-array 0 :initial-element 0 :element-type :integer))
    ((:angle_up __angle_up) (make-array 0 :initial-element 0 :element-type :integer))
    ((:angle_low __angle_low) (make-array 0 :initial-element 0 :element-type :integer))
    ((:speed_up __speed_up) (make-array 0 :initial-element 0 :element-type :integer))
    ((:speed_low __speed_low) (make-array 0 :initial-element 0 :element-type :integer))
    ((:force_up __force_up) (make-array 0 :initial-element 0 :element-type :integer))
    ((:force_low __force_low) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _manu (string __manu))
   (setq _type (round __type))
   (setq _hv (string __hv))
   (setq _sv (string __sv))
   (setq _bv (string __bv))
   (setq _id (round __id))
   (setq _dof (round __dof))
   (setq _check (round __check))
   (setq _bee (round __bee))
   (setq _force __force)
   (setq _touch __touch)
   (setq _touch_num (round __touch_num))
   (setq _touch_sw (round __touch_sw))
   (setq _hand (round __hand))
   (setq _pos_up __pos_up)
   (setq _pos_low __pos_low)
   (setq _angle_up __angle_up)
   (setq _angle_low __angle_low)
   (setq _speed_up __speed_up)
   (setq _speed_low __speed_low)
   (setq _force_up __force_up)
   (setq _force_low __force_low)
   self)
  (:manu
   (&optional __manu)
   (if __manu (setq _manu __manu)) _manu)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:hv
   (&optional __hv)
   (if __hv (setq _hv __hv)) _hv)
  (:sv
   (&optional __sv)
   (if __sv (setq _sv __sv)) _sv)
  (:bv
   (&optional __bv)
   (if __bv (setq _bv __bv)) _bv)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:dof
   (&optional __dof)
   (if __dof (setq _dof __dof)) _dof)
  (:check
   (&optional __check)
   (if __check (setq _check __check)) _check)
  (:bee
   (&optional __bee)
   (if __bee (setq _bee __bee)) _bee)
  (:force
   (&optional (__force :null))
   (if (not (eq __force :null)) (setq _force __force)) _force)
  (:touch
   (&optional (__touch :null))
   (if (not (eq __touch :null)) (setq _touch __touch)) _touch)
  (:touch_num
   (&optional __touch_num)
   (if __touch_num (setq _touch_num __touch_num)) _touch_num)
  (:touch_sw
   (&optional __touch_sw)
   (if __touch_sw (setq _touch_sw __touch_sw)) _touch_sw)
  (:hand
   (&optional __hand)
   (if __hand (setq _hand __hand)) _hand)
  (:pos_up
   (&optional __pos_up)
   (if __pos_up (setq _pos_up __pos_up)) _pos_up)
  (:pos_low
   (&optional __pos_low)
   (if __pos_low (setq _pos_low __pos_low)) _pos_low)
  (:angle_up
   (&optional __angle_up)
   (if __angle_up (setq _angle_up __angle_up)) _angle_up)
  (:angle_low
   (&optional __angle_low)
   (if __angle_low (setq _angle_low __angle_low)) _angle_low)
  (:speed_up
   (&optional __speed_up)
   (if __speed_up (setq _speed_up __speed_up)) _speed_up)
  (:speed_low
   (&optional __speed_low)
   (if __speed_low (setq _speed_low __speed_low)) _speed_low)
  (:force_up
   (&optional __force_up)
   (if __force_up (setq _force_up __force_up)) _force_up)
  (:force_low
   (&optional __force_low)
   (if __force_low (setq _force_low __force_low)) _force_low)
  (:serialization-length
   ()
   (+
    ;; string _manu
    4 (length _manu)
    ;; int8 _type
    1
    ;; string _hv
    4 (length _hv)
    ;; string _sv
    4 (length _sv)
    ;; string _bv
    4 (length _bv)
    ;; int32 _id
    4
    ;; int8 _dof
    1
    ;; int8 _check
    1
    ;; int8 _bee
    1
    ;; bool _force
    1
    ;; bool _touch
    1
    ;; int8 _touch_num
    1
    ;; int8 _touch_sw
    1
    ;; int8 _hand
    1
    ;; int32[] _pos_up
    (* 4    (length _pos_up)) 4
    ;; int32[] _pos_low
    (* 4    (length _pos_low)) 4
    ;; int32[] _angle_up
    (* 4    (length _angle_up)) 4
    ;; int32[] _angle_low
    (* 4    (length _angle_low)) 4
    ;; int32[] _speed_up
    (* 4    (length _speed_up)) 4
    ;; int32[] _speed_low
    (* 4    (length _speed_low)) 4
    ;; int32[] _force_up
    (* 4    (length _force_up)) 4
    ;; int32[] _force_low
    (* 4    (length _force_low)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _manu
       (write-long (length _manu) s) (princ _manu s)
     ;; int8 _type
       (write-byte _type s)
     ;; string _hv
       (write-long (length _hv) s) (princ _hv s)
     ;; string _sv
       (write-long (length _sv) s) (princ _sv s)
     ;; string _bv
       (write-long (length _bv) s) (princ _bv s)
     ;; int32 _id
       (write-long _id s)
     ;; int8 _dof
       (write-byte _dof s)
     ;; int8 _check
       (write-byte _check s)
     ;; int8 _bee
       (write-byte _bee s)
     ;; bool _force
       (if _force (write-byte -1 s) (write-byte 0 s))
     ;; bool _touch
       (if _touch (write-byte -1 s) (write-byte 0 s))
     ;; int8 _touch_num
       (write-byte _touch_num s)
     ;; int8 _touch_sw
       (write-byte _touch_sw s)
     ;; int8 _hand
       (write-byte _hand s)
     ;; int32[] _pos_up
     (write-long (length _pos_up) s)
     (dotimes (i (length _pos_up))
       (write-long (elt _pos_up i) s)
       )
     ;; int32[] _pos_low
     (write-long (length _pos_low) s)
     (dotimes (i (length _pos_low))
       (write-long (elt _pos_low i) s)
       )
     ;; int32[] _angle_up
     (write-long (length _angle_up) s)
     (dotimes (i (length _angle_up))
       (write-long (elt _angle_up i) s)
       )
     ;; int32[] _angle_low
     (write-long (length _angle_low) s)
     (dotimes (i (length _angle_low))
       (write-long (elt _angle_low i) s)
       )
     ;; int32[] _speed_up
     (write-long (length _speed_up) s)
     (dotimes (i (length _speed_up))
       (write-long (elt _speed_up i) s)
       )
     ;; int32[] _speed_low
     (write-long (length _speed_low) s)
     (dotimes (i (length _speed_low))
       (write-long (elt _speed_low i) s)
       )
     ;; int32[] _force_up
     (write-long (length _force_up) s)
     (dotimes (i (length _force_up))
       (write-long (elt _force_up i) s)
       )
     ;; int32[] _force_low
     (write-long (length _force_low) s)
     (dotimes (i (length _force_low))
       (write-long (elt _force_low i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _manu
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _manu (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _type 127) (setq _type (- _type 256)))
   ;; string _hv
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _hv (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _sv
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _sv (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _bv
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _bv (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int8 _dof
     (setq _dof (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _dof 127) (setq _dof (- _dof 256)))
   ;; int8 _check
     (setq _check (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _check 127) (setq _check (- _check 256)))
   ;; int8 _bee
     (setq _bee (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _bee 127) (setq _bee (- _bee 256)))
   ;; bool _force
     (setq _force (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _touch
     (setq _touch (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int8 _touch_num
     (setq _touch_num (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _touch_num 127) (setq _touch_num (- _touch_num 256)))
   ;; int8 _touch_sw
     (setq _touch_sw (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _touch_sw 127) (setq _touch_sw (- _touch_sw 256)))
   ;; int8 _hand
     (setq _hand (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _hand 127) (setq _hand (- _hand 256)))
   ;; int32[] _pos_up
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pos_up (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _pos_up i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _pos_low
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pos_low (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _pos_low i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _angle_up
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _angle_up (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _angle_up i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _angle_low
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _angle_low (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _angle_low i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _speed_up
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _speed_up (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _speed_up i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _speed_low
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _speed_low (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _speed_low i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _force_up
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _force_up (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _force_up i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _force_low
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _force_low (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _force_low i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get rm_msgs::Rm_Plus_Base :md5sum-) "6811b6d3be27919dd94cf28267ef3a90")
(setf (get rm_msgs::Rm_Plus_Base :datatype-) "rm_msgs/Rm_Plus_Base")
(setf (get rm_msgs::Rm_Plus_Base :definition-)
      "string manu              # 设备厂家
int8 type                # 设备类型 1：两指夹爪 2：五指灵巧手 3：三指夹爪
string hv                # 硬件版本
string sv                # 软件版本
string bv                # boot版本
int32 id                 # 设备ID
int8 dof                 # 自由度
int8 check               # 自检开关
int8 bee                 # 蜂鸣器开关
bool force               # 力控支持
bool touch               # 触觉支持
int8 touch_num           # 触觉个数
int8 touch_sw            # 触觉开关
int8 hand                # 手方向 1 ：左手 2： 右手
int32[] pos_up           # 位置上限,单位：无量纲
int32[] pos_low          # 位置下限,单位：无量纲
int32[] angle_up         # 角度上限,单位：0.01度
int32[] angle_low        # 角度下限,单位：0.01度
int32[] speed_up         # 速度上限,单位：无量纲
int32[] speed_low        # 速度下限,单位：无量纲
int32[] force_up         # 力上限,单位：0.001N 
int32[] force_low        # 力下限,单位：0.001N 

")



(provide :rm_msgs/Rm_Plus_Base "6811b6d3be27919dd94cf28267ef3a90")


