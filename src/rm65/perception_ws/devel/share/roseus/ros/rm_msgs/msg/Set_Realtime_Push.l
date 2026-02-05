;; Auto-generated. Do not edit!


(when (boundp 'rm_msgs::Set_Realtime_Push)
  (if (not (find-package "RM_MSGS"))
    (make-package "RM_MSGS"))
  (shadow 'Set_Realtime_Push (find-package "RM_MSGS")))
(unless (find-package "RM_MSGS::SET_REALTIME_PUSH")
  (make-package "RM_MSGS::SET_REALTIME_PUSH"))

(in-package "ROS")
;;//! \htmlinclude Set_Realtime_Push.msg.html


(defclass rm_msgs::Set_Realtime_Push
  :super ros::object
  :slots (_cycle _port _force_coordinate _ip _aloha_state_enable _arm_current_status_enable _expand_state_enable _hand_enable _joint_acc_enable _joint_speed_enable _lift_state_enable _tail_end_enable _rm_plus_base_enable _rm_plus_state_enable ))

(defmethod rm_msgs::Set_Realtime_Push
  (:init
   (&key
    ((:cycle __cycle) 0)
    ((:port __port) 0)
    ((:force_coordinate __force_coordinate) 0)
    ((:ip __ip) "")
    ((:aloha_state_enable __aloha_state_enable) nil)
    ((:arm_current_status_enable __arm_current_status_enable) nil)
    ((:expand_state_enable __expand_state_enable) nil)
    ((:hand_enable __hand_enable) nil)
    ((:joint_acc_enable __joint_acc_enable) nil)
    ((:joint_speed_enable __joint_speed_enable) nil)
    ((:lift_state_enable __lift_state_enable) nil)
    ((:tail_end_enable __tail_end_enable) nil)
    ((:rm_plus_base_enable __rm_plus_base_enable) nil)
    ((:rm_plus_state_enable __rm_plus_state_enable) nil)
    )
   (send-super :init)
   (setq _cycle (round __cycle))
   (setq _port (round __port))
   (setq _force_coordinate (round __force_coordinate))
   (setq _ip (string __ip))
   (setq _aloha_state_enable __aloha_state_enable)
   (setq _arm_current_status_enable __arm_current_status_enable)
   (setq _expand_state_enable __expand_state_enable)
   (setq _hand_enable __hand_enable)
   (setq _joint_acc_enable __joint_acc_enable)
   (setq _joint_speed_enable __joint_speed_enable)
   (setq _lift_state_enable __lift_state_enable)
   (setq _tail_end_enable __tail_end_enable)
   (setq _rm_plus_base_enable __rm_plus_base_enable)
   (setq _rm_plus_state_enable __rm_plus_state_enable)
   self)
  (:cycle
   (&optional __cycle)
   (if __cycle (setq _cycle __cycle)) _cycle)
  (:port
   (&optional __port)
   (if __port (setq _port __port)) _port)
  (:force_coordinate
   (&optional __force_coordinate)
   (if __force_coordinate (setq _force_coordinate __force_coordinate)) _force_coordinate)
  (:ip
   (&optional __ip)
   (if __ip (setq _ip __ip)) _ip)
  (:aloha_state_enable
   (&optional (__aloha_state_enable :null))
   (if (not (eq __aloha_state_enable :null)) (setq _aloha_state_enable __aloha_state_enable)) _aloha_state_enable)
  (:arm_current_status_enable
   (&optional (__arm_current_status_enable :null))
   (if (not (eq __arm_current_status_enable :null)) (setq _arm_current_status_enable __arm_current_status_enable)) _arm_current_status_enable)
  (:expand_state_enable
   (&optional (__expand_state_enable :null))
   (if (not (eq __expand_state_enable :null)) (setq _expand_state_enable __expand_state_enable)) _expand_state_enable)
  (:hand_enable
   (&optional (__hand_enable :null))
   (if (not (eq __hand_enable :null)) (setq _hand_enable __hand_enable)) _hand_enable)
  (:joint_acc_enable
   (&optional (__joint_acc_enable :null))
   (if (not (eq __joint_acc_enable :null)) (setq _joint_acc_enable __joint_acc_enable)) _joint_acc_enable)
  (:joint_speed_enable
   (&optional (__joint_speed_enable :null))
   (if (not (eq __joint_speed_enable :null)) (setq _joint_speed_enable __joint_speed_enable)) _joint_speed_enable)
  (:lift_state_enable
   (&optional (__lift_state_enable :null))
   (if (not (eq __lift_state_enable :null)) (setq _lift_state_enable __lift_state_enable)) _lift_state_enable)
  (:tail_end_enable
   (&optional (__tail_end_enable :null))
   (if (not (eq __tail_end_enable :null)) (setq _tail_end_enable __tail_end_enable)) _tail_end_enable)
  (:rm_plus_base_enable
   (&optional (__rm_plus_base_enable :null))
   (if (not (eq __rm_plus_base_enable :null)) (setq _rm_plus_base_enable __rm_plus_base_enable)) _rm_plus_base_enable)
  (:rm_plus_state_enable
   (&optional (__rm_plus_state_enable :null))
   (if (not (eq __rm_plus_state_enable :null)) (setq _rm_plus_state_enable __rm_plus_state_enable)) _rm_plus_state_enable)
  (:serialization-length
   ()
   (+
    ;; uint16 _cycle
    2
    ;; uint16 _port
    2
    ;; uint16 _force_coordinate
    2
    ;; string _ip
    4 (length _ip)
    ;; bool _aloha_state_enable
    1
    ;; bool _arm_current_status_enable
    1
    ;; bool _expand_state_enable
    1
    ;; bool _hand_enable
    1
    ;; bool _joint_acc_enable
    1
    ;; bool _joint_speed_enable
    1
    ;; bool _lift_state_enable
    1
    ;; bool _tail_end_enable
    1
    ;; bool _rm_plus_base_enable
    1
    ;; bool _rm_plus_state_enable
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _cycle
       (write-word _cycle s)
     ;; uint16 _port
       (write-word _port s)
     ;; uint16 _force_coordinate
       (write-word _force_coordinate s)
     ;; string _ip
       (write-long (length _ip) s) (princ _ip s)
     ;; bool _aloha_state_enable
       (if _aloha_state_enable (write-byte -1 s) (write-byte 0 s))
     ;; bool _arm_current_status_enable
       (if _arm_current_status_enable (write-byte -1 s) (write-byte 0 s))
     ;; bool _expand_state_enable
       (if _expand_state_enable (write-byte -1 s) (write-byte 0 s))
     ;; bool _hand_enable
       (if _hand_enable (write-byte -1 s) (write-byte 0 s))
     ;; bool _joint_acc_enable
       (if _joint_acc_enable (write-byte -1 s) (write-byte 0 s))
     ;; bool _joint_speed_enable
       (if _joint_speed_enable (write-byte -1 s) (write-byte 0 s))
     ;; bool _lift_state_enable
       (if _lift_state_enable (write-byte -1 s) (write-byte 0 s))
     ;; bool _tail_end_enable
       (if _tail_end_enable (write-byte -1 s) (write-byte 0 s))
     ;; bool _rm_plus_base_enable
       (if _rm_plus_base_enable (write-byte -1 s) (write-byte 0 s))
     ;; bool _rm_plus_state_enable
       (if _rm_plus_state_enable (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _cycle
     (setq _cycle (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _port
     (setq _port (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _force_coordinate
     (setq _force_coordinate (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; string _ip
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _ip (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _aloha_state_enable
     (setq _aloha_state_enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _arm_current_status_enable
     (setq _arm_current_status_enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _expand_state_enable
     (setq _expand_state_enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _hand_enable
     (setq _hand_enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _joint_acc_enable
     (setq _joint_acc_enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _joint_speed_enable
     (setq _joint_speed_enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _lift_state_enable
     (setq _lift_state_enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _tail_end_enable
     (setq _tail_end_enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _rm_plus_base_enable
     (setq _rm_plus_base_enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _rm_plus_state_enable
     (setq _rm_plus_state_enable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get rm_msgs::Set_Realtime_Push :md5sum-) "29a80623aa411fb9cc6b96b119e8d448")
(setf (get rm_msgs::Set_Realtime_Push :datatype-) "rm_msgs/Set_Realtime_Push")
(setf (get rm_msgs::Set_Realtime_Push :definition-)
      "uint16 cycle
uint16 port
uint16 force_coordinate
string ip
bool aloha_state_enable
bool arm_current_status_enable
bool expand_state_enable
bool hand_enable
bool joint_acc_enable
bool joint_speed_enable
bool lift_state_enable
bool tail_end_enable
bool rm_plus_base_enable
bool rm_plus_state_enable
")



(provide :rm_msgs/Set_Realtime_Push "29a80623aa411fb9cc6b96b119e8d448")


