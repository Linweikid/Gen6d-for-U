
(cl:in-package :asdf)

(defsystem "pose_estimation_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Pose6D" :depends-on ("_package_Pose6D"))
    (:file "_package_Pose6D" :depends-on ("_package"))
  ))