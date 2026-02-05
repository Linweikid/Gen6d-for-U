;; Auto-generated. Do not edit!


(when (boundp 'rm_msgs::Hand_Status)
  (if (not (find-package "RM_MSGS"))
    (make-package "RM_MSGS"))
  (shadow 'Hand_Status (find-package "RM_MSGS")))
(unless (find-package "RM_MSGS::HAND_STATUS")
  (make-package "RM_MSGS::HAND_STATUS"))

(in-package "ROS")
;;//! \htmlinclude Hand_Status.msg.html


(defclass rm_msgs::Hand_Status
  :super ros::object
  :slots (_hand_angle _hand_pos _hand_state _hand_force _hand_err ))

(defmethod rm_msgs::Hand_Status
  (:init
   (&key
    ((:hand_angle __hand_angle) (make-array 6 :initial-element 0 :element-type :integer))
    ((:hand_pos __hand_pos) (make-array 6 :initial-element 0 :element-type :integer))
    ((:hand_state __hand_state) (make-array 6 :initial-element 0 :element-type :integer))
    ((:hand_force __hand_force) (make-array 6 :initial-element 0 :element-type :integer))
    ((:hand_err __hand_err) 0)
    )
   (send-super :init)
   (setq _hand_angle __hand_angle)
   (setq _hand_pos __hand_pos)
   (setq _hand_state __hand_state)
   (setq _hand_force __hand_force)
   (setq _hand_err (round __hand_err))
   self)
  (:hand_angle
   (&optional __hand_angle)
   (if __hand_angle (setq _hand_angle __hand_angle)) _hand_angle)
  (:hand_pos
   (&optional __hand_pos)
   (if __hand_pos (setq _hand_pos __hand_pos)) _hand_pos)
  (:hand_state
   (&optional __hand_state)
   (if __hand_state (setq _hand_state __hand_state)) _hand_state)
  (:hand_force
   (&optional __hand_force)
   (if __hand_force (setq _hand_force __hand_force)) _hand_force)
  (:hand_err
   (&optional __hand_err)
   (if __hand_err (setq _hand_err __hand_err)) _hand_err)
  (:serialization-length
   ()
   (+
    ;; uint16[6] _hand_angle
    (* 2    6)
    ;; uint16[6] _hand_pos
    (* 2    6)
    ;; uint16[6] _hand_state
    (* 2    6)
    ;; uint16[6] _hand_force
    (* 2    6)
    ;; uint16 _hand_err
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16[6] _hand_angle
     (dotimes (i 6)
       (write-word (elt _hand_angle i) s)
       )
     ;; uint16[6] _hand_pos
     (dotimes (i 6)
       (write-word (elt _hand_pos i) s)
       )
     ;; uint16[6] _hand_state
     (dotimes (i 6)
       (write-word (elt _hand_state i) s)
       )
     ;; uint16[6] _hand_force
     (dotimes (i 6)
       (write-word (elt _hand_force i) s)
       )
     ;; uint16 _hand_err
       (write-word _hand_err s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16[6] _hand_angle
   (dotimes (i (length _hand_angle))
     (setf (elt _hand_angle i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;; uint16[6] _hand_pos
   (dotimes (i (length _hand_pos))
     (setf (elt _hand_pos i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;; uint16[6] _hand_state
   (dotimes (i (length _hand_state))
     (setf (elt _hand_state i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;; uint16[6] _hand_force
   (dotimes (i (length _hand_force))
     (setf (elt _hand_force i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;; uint16 _hand_err
     (setq _hand_err (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get rm_msgs::Hand_Status :md5sum-) "1cce752e69bf0b22631007e9bc8d2458")
(setf (get rm_msgs::Hand_Status :datatype-) "rm_msgs/Hand_Status")
(setf (get rm_msgs::Hand_Status :definition-)
      "#灵巧手上报状态

uint16[6] hand_angle	#手指角度数组，范围：0~2000.
uint16[6] hand_pos	#手指位置数组，范围：0~1000.
uint16[6] hand_state	#手指状态,0正在松开，1正在抓取，2位置到位停止，3力到位停止，5电流保护停止，6电缸堵转停止，7电缸故障停止
uint16[6] hand_force    #灵巧手自由度电流，单位mN
uint16  hand_err          #灵巧手系统错误，1表示有错误，0表示无错误
")



(provide :rm_msgs/Hand_Status "1cce752e69bf0b22631007e9bc8d2458")


