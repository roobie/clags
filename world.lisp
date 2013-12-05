(load "entitites.lisp")
(load "utils.lisp")

(defclass tile ()
  ((kind :accessor kind
         :initarg :kind)
   (glyph :accessor glyph
          :initarg :glyph)
   (colour :accessor colour
           :initarg :colour)))

(defvar *tiles* (make-hash-table))

(add-instance-maker *tiles* :floor 'tile :kind :floor :glyph "." :colour :white)
(add-instance-maker *tiles* :wall 'tile :kind :wall :glyph "#" :colour :white)
(add-instance-maker *tiles* :bound 'tile :kind :bound :glyph "X" :colour :white)

(defclass zone ()
  ((tiles :initform (make-array '(10 10) :element-type 'tile))))

(defclass world ()
  ((entities :accessor entities
             :initarg :entities
             :initform '())
   (current-zone :accessor current-zone
                 :initarg :current-zone
                 :initform (make-instance 'zone))))

(defclass program ()
  ((world :accessor world
          :initarg :world
          :initform (make-instance 'world))))
