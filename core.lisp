
(in-package :cl-user)

(defpackage :clags
  (:use :common-lisp))

(in-package :clags)

(load "entities.lisp")
(load "world.lisp")



(defun main ()
  (setf *random-state* (make-random-state t))
  "Will perhaps do something later on")

(defun test-clags ()
  "Will test the system")
