;; Auto-generated. Do not edit!


(when (boundp 'rm_msgs::Joint_PoseEuler)
  (if (not (find-package "RM_MSGS"))
    (make-package "RM_MSGS"))
  (shadow 'Joint_PoseEuler (find-package "RM_MSGS")))
(unless (find-package "RM_MSGS::JOINT_POSEEULER")
  (make-package "RM_MSGS::JOINT_POSEEULER"))

(in-package "ROS")
;;//! \htmlinclude Joint_PoseEuler.msg.html


(defclass rm_msgs::Joint_PoseEuler
  :super ros::object
  :slots (_euler _position ))

(defmethod rm_msgs::Joint_PoseEuler
  (:init
   (&key
    ((:euler __euler) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:position __position) (make-array 3 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _euler __euler)
   (setq _position __position)
   self)
  (:euler
   (&optional __euler)
   (if __euler (setq _euler __euler)) _euler)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:serialization-length
   ()
   (+
    ;; float32[3] _euler
    (* 4    3)
    ;; float32[3] _position
    (* 4    3)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[3] _euler
     (dotimes (i 3)
       (sys::poke (elt _euler i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[3] _position
     (dotimes (i 3)
       (sys::poke (elt _position i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[3] _euler
   (dotimes (i (length _euler))
     (setf (elt _euler i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[3] _position
   (dotimes (i (length _position))
     (setf (elt _position i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get rm_msgs::Joint_PoseEuler :md5sum-) "9254815d452fb49553cab1a1384a3e0a")
(setf (get rm_msgs::Joint_PoseEuler :datatype-) "rm_msgs/Joint_PoseEuler")
(setf (get rm_msgs::Joint_PoseEuler :definition-)
      "float32[3] euler
float32[3] position

")



(provide :rm_msgs/Joint_PoseEuler "9254815d452fb49553cab1a1384a3e0a")


