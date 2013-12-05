
(defmacro add-instance-maker (hash-table key class &rest initargs)
  `(let ((maker (lambda () (make-instance ,class ,@initargs))))
     (setf (gethash ,key ,hash-table) maker)))


(defun radial-distance (x1 y1 x2 y2)
  (max (abs (- x1 x2))
       (abs (- y1 y2))))

