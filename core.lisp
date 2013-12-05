(load "entitites.lsp")

(defclass tile ()
  ((kind :accessor kind
         :initarg :kind)
   (glyph :accessor glyph
          :initarg :glyph)
   (colour :accessor colour
           :initarg :colour)))

(defvar *tiles* (make-hash-table))
(defun add-tile-maker (name-kind glyph colour)
  (setf (gethash name-kind *tiles*)
        (lambda () (make-instance 'tile
                             :kind name-kind
                             :glyph glyph
                             :colour colour))))

(add-tile-maker :floor "." :white)
(add-tile-maker :wall "#" :white)
(add-tile-maker :bound "X" :white)

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
