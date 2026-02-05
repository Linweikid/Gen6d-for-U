;; Auto-generated. Do not edit!


(when (boundp 'rm_msgs::Err)
  (if (not (find-package "RM_MSGS"))
    (make-package "RM_MSGS"))
  (shadow 'Err (find-package "RM_MSGS")))
(unless (find-package "RM_MSGS::ERR")
  (make-package "RM_MSGS::ERR"))

(in-package "ROS")
;;//! \htmlinclude Err.msg.html


(defclass rm_msgs::Err
  :super ros::object
  :slots (_err ))

(defmethod rm_msgs::Err
  (:init
   (&key
    ((:err __err) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _err __err)
   self)
  (:err
   (&optional __err)
   (if __err (setq _err __err)) _err)
  (:serialization-length
   ()
   (+
    ;; uint16[] _err
    (* 2    (length _err)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16[] _err
     (write-long (length _err) s)
     (dotimes (i (length _err))
       (write-word (elt _err i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16[] _err
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _err (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _err i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(setf (get rm_msgs::Err :md5sum-) "5b0a411346a36392edd94edb3ec31d40")
(setf (get rm_msgs::Err :datatype-) "rm_msgs/Err")
(setf (get rm_msgs::Err :definition-)
      "uint16[] err
")



(provide :rm_msgs/Err "5b0a411346a36392edd94edb3ec31d40")


