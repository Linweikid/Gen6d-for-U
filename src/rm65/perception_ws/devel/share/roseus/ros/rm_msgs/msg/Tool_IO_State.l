;; Auto-generated. Do not edit!


(when (boundp 'rm_msgs::Tool_IO_State)
  (if (not (find-package "RM_MSGS"))
    (make-package "RM_MSGS"))
  (shadow 'Tool_IO_State (find-package "RM_MSGS")))
(unless (find-package "RM_MSGS::TOOL_IO_STATE")
  (make-package "RM_MSGS::TOOL_IO_STATE"))

(in-package "ROS")
;;//! \htmlinclude Tool_IO_State.msg.html


(defclass rm_msgs::Tool_IO_State
  :super ros::object
  :slots (_Tool_IO_Mode _Tool_IO_State ))

(defmethod rm_msgs::Tool_IO_State
  (:init
   (&key
    ((:Tool_IO_Mode __Tool_IO_Mode) (make-array 2 :initial-element 0 :element-type :integer))
    ((:Tool_IO_State __Tool_IO_State) (make-array 2 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _Tool_IO_Mode __Tool_IO_Mode)
   (setq _Tool_IO_State __Tool_IO_State)
   self)
  (:Tool_IO_Mode
   (&optional __Tool_IO_Mode)
   (if __Tool_IO_Mode (setq _Tool_IO_Mode __Tool_IO_Mode)) _Tool_IO_Mode)
  (:Tool_IO_State
   (&optional __Tool_IO_State)
   (if __Tool_IO_State (setq _Tool_IO_State __Tool_IO_State)) _Tool_IO_State)
  (:serialization-length
   ()
   (+
    ;; int8[2] _Tool_IO_Mode
    (* 1    2)
    ;; int8[2] _Tool_IO_State
    (* 1    2)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8[2] _Tool_IO_Mode
     (dotimes (i 2)
       (write-byte (elt _Tool_IO_Mode i) s)
       )
     ;; int8[2] _Tool_IO_State
     (dotimes (i 2)
       (write-byte (elt _Tool_IO_State i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8[2] _Tool_IO_Mode
   (dotimes (i (length _Tool_IO_Mode))
     (setf (elt _Tool_IO_Mode i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _Tool_IO_Mode i) 127) (setf (elt _Tool_IO_Mode i) (- (elt _Tool_IO_Mode i) 256)))
     )
   ;; int8[2] _Tool_IO_State
   (dotimes (i (length _Tool_IO_State))
     (setf (elt _Tool_IO_State i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _Tool_IO_State i) 127) (setf (elt _Tool_IO_State i) (- (elt _Tool_IO_State i) 256)))
     )
   ;;
   self)
  )

(setf (get rm_msgs::Tool_IO_State :md5sum-) "3a8d67c6456299e65ebafb60fec4550b")
(setf (get rm_msgs::Tool_IO_State :datatype-) "rm_msgs/Tool_IO_State")
(setf (get rm_msgs::Tool_IO_State :definition-)
      "int8[2] Tool_IO_Mode          #数字I/O输入/输出状态  0-输入模式，1-输出模式
int8[2] Tool_IO_State         #数字I/O电平状态      0-低，1-高

")



(provide :rm_msgs/Tool_IO_State "3a8d67c6456299e65ebafb60fec4550b")


