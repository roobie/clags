
(in-package :clags)

(load "entities.lisp")
(load "aspects.lisp")
(load "rules.lisp")

(defclass player ()
  ((entity :accessor entity
           :initarg :entity
           :initform (make-instance 'human))))
