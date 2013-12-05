(load "utils.lisp")

(defclass effect () ())

(defclass buff (effect)
  ()
  (:documentation
   "Buffs are positive effects."))
(defclass debuff (effect)
  ()
  (:documentation
   "Debuffs are effects that negatively affects the entity,
such as e.g. poison and illnesses"))

;(defclass trauma () ())
(defclass organ ()
  ((name :accessor name
         :initarg :name)))

(defvar *organs* (make-hash-table))
(add-instance-maker *organs* :heart 'organ :name :heart)

(defclass ligament () ())
(defclass tendon () ())
(defclass bone () ())
(defclass muscle () ())
(defclass fat () ())
(defclass joint () ())
(defclass blood-vessel () ())

(defclass body-part ()
  ((organs :accessor organs
           :initarg :organs
           :initform '())
   (ligaments :accessor ligaments
              :initarg :ligaments
              :initform '())
   (tendons :accessor tendons
            :initarg :tendons
            :initform '())))

(defclass anatomy ()
  ((body-parts :accessor body-parts
               :initarg :body-parts)))

(defclass status ()
    ((vitality :accessor vitality
               :initarg :vitality
               :initform t)
     (debuffs :accessor debuffs
              :initarg :debuffs
              :initform '())
     (buffs :accessor buffs
            :initarg :buffs
            :initform '())
     ;(trauma :accessor trauma :initarg :trauma :initform (make-instance 'trauma))
     ))

(defclass damage ()
  (type :accessor type
        :initarg :type))

