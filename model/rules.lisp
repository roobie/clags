
(in-package :clags)

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

(defclass damageable ()
  ((damaged? :accessor damaged?
             :initform nil)
   (damage-description :accessor damage-description
                       :initform "")
   (damage-over-time :accessor damage-over-time
                     :initform `(,(lambda () nil)))))

;(defclass trauma () ())
(defclass body-component (damageable)
  ()
  (:documentation
   "A class of body components"))

(defclass organ (body-component)
  ((name :accessor name
         :initarg :name)
   (importance :accessor importance
               :initarg :importance)))

(defvar *organs* (make-hash-table))
(add-instance-maker *organs* :heart 'organ :name :heart :importance :vital)
(add-instance-maker *organs* :brain 'organ :name :brain :importance :vital)

(defclass ligament (body-component) ())
(defclass tendon (body-component) ())
(defclass bone (body-component) ())
(defclass muscle (body-component) ())
(defclass fat (body-component) ())
(defclass joint (body-component) ())
(defclass blood-vessel (body-component) ())

(defclass body-part ()
  ((organs :accessor organs
           :initarg :organs
           :initform '())
   (ligaments :accessor ligaments
              :initarg :ligaments
              :initform '())
   (tendons :accessor tendons
            :initarg :tendons
            :initform '())
   (bones :accessor bones
          :initarg :bones
          :initform '())
   (muscles :accessor muscles
            :initarg :muscles
            :initform '())
   (fats :accessor fats
         :initarg :fats
         :initform '())
   (joints :accessor joints
           :initarg :joints
           :initform '())
   (blood-vessels :accessor blood-vessels
                  :initarg :blood-vessels
                  :initform '())))

(defclass anatomy ()
  ((body-parts :accessor body-parts
               :initarg :body-parts
               :initform '())))

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
     ;(anatomy :accessor anatomy :initarg :anatomy :initform (make-instance 'anatomy))
     (descriptors :accessor descriptors
                  :initform '())))

(defgeneric apply-effect (effect status)
  (:documentation "Apply the specific effect to the relevant status"))

(defgeneric apply-effect-locally (effect status body-component)
  (:documentation "Apply the specific effect to the relevant status locally to a specific body component."))

(defclass poison (debuff) ())
(defclass necrotic-poison (poison) ())

(defmethod apply-effect-locally ((p necrotic-poison) (s status) (m muscle))
    (progn
      (setf (descriptors s) (cons (descriptors s) :necrotic-poison))
      (setf (damaged? m) t)
      (setf (damage-description m) (format nil "This muscle is damaged by a necrotic poison. It will soon perish if not treated."))
      (setf (damage-over-time m) (cons (damage-over-time m) (lambda () "Mutate the state of the muscle"))))
    m)

(defclass damage ()
  ((kind :accessor kind
         :initarg :kind)))

