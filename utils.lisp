
(defmacro instantiate (class &rest initargs)
  ;; This macro allows you to instantiate a class created by defclass
  ;; but opposed to make-instance, you don't need to quote the class name
  ;; ie. (instantiate my-class :slot1 "awesome")
  `(make-instance ',class ,@initargs))

(defmacro add-instance-maker (hash-table key class &rest initargs)
  `(let ((maker (lambda () (make-instance ',class ,@initargs))))
     (setf (gethash ,key ,hash-table) maker)))

(defun radial-distance (x1 y1 x2 y2)
  (max (abs (- x1 x2))
       (abs (- y1 y2))))

