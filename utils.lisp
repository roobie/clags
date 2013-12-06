
(in-package :clags)

(defmacro instantiate (class &rest initargs)
  "This macro allows you to instantiate a class created by defclass
  but opposed to make-instance, you don't need to quote the class name
  ie. (instantiate my-class :slot1 :awesome)"
  `(make-instance ',class ,@initargs))

(defun add-instance-maker (hash-table key class &rest initargs)
  (let ((maker (lambda () (instantiate class initargs))))
     (setf (gethash key hash-table) maker)))

(defun radial-distance (x1 y1 x2 y2)
  (max (abs (- x1 x2))
       (abs (- y1 y2))))

(defclass uuid ()
  ((bytes :accessor bytes
          :initarg :bytes
          :initform (loop for i upto 15
                         collect (random (+ #xff 1))))))

(defgeneric to-string (val))
(defgeneric to-format (val format))

(defmethod to-string ((val uuid))
  (format nil ;return something like "DC9D8931-6C40-E594-1D43-9825CED24AC5"
   "~{~#[~;~;~;~;~;~;~;~;~;~;~;~;~;~;~;~;~x~x~x~x-~x~x-~x~x-~x~x-~x~x~x~x~x~x~]~}"
   (bytes val)))

(defmethod to-format ((val uuid) format)
  (case format
    (:simple (format nil "~{~x~}" (bytes val)))
    (:braces (format nil "{~a}" (to-string val)))
    (:parens (format nil "(~a)" (to-string val)))
    (otherwise (to-string val))))
