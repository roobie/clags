
(in-package :clags)

(load "model/entities.lisp")
(load "model/player.lisp")
(load "model/world.lisp")

(defvar *debug* t
  "If library should print debug messages.")

(defun init ()
  (when *debug* (format t "Setting *random-state* to new random state~&"))
  (setf *random-state* (make-random-state t))
  "Initializes mandatory things for this library.")

(defun test ()
  "Will test the system"
  (let ((p (make-instance 'player))
        (g (make-instance 'goblin)))
    (when *debug*
      (format t "Player: ~A~&" p)
      (format t "P:Entity ~A~&" (entity p))
      (format t "Goblin ~A~&" g))
    (let ((s (status g))) ;; use let*
      (format t "~A~&" s)
      (let ((a (anatomy s)))
        (format t "~A~&" a)
        (let ((bp (first (body-parts a))))
          (format t "~A~&" bp)
          (let ((m (first (muscles bp))))
            (progn
              (format t "~A~&Damaged? ~A~&Descr <~A>~&" m (damaged? m) (damage-description m))
              (apply-effect-locally (make-instance 'necrotic-poison) s m)
              (format t "~A~&Damaged? ~A~&Descr <~A>~&" m (damaged? m) (damage-description m)))))))))

(when *debug*
  (init)
  ;(test)
  )
