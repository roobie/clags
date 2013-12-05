(load "utils.lisp")

(defclass skill ()
  ((name :accessor name
         :initarg :name)
   (experience :accessor experience
               :initarg :experience
               :initform 0)
   (synergies :accessor synergies
              :initarg :synergies
              :initform '())))

(defvar *skills* (make-hash-table))
(add-instance-maker *skills* :spotting
                    skill
                    :name :spotting
                    :synergies '(:psyche :sight))
