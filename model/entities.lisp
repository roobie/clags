
(in-package :clags)

(load "aspects.lisp")
(load "rules.lisp")
(load "skills.lisp")

(defclass entity ()
  ((location :accessor location
             :initarg :location
             :initform '(0 0))
   (volume :accessor volume
           :initarg :volume
           :initform 0)
   (density :accessor density
            :initarg :density
            :initform 0)))

(defgeneric tick (entity world timedelta)
  (:documentation "Go through a `tick` for a certain entity instance"))

(defmethod tick ((entity entity) world timedelta)
  world)

(defclass thing (entity)
  ())

(defmethod tick ((thing thing) world timedelta)
  world)

(defclass undead (entity mobile destructible)
  ())

(defclass organism (entity killable grower)
  ((status :accessor status :initarg :status :initform (make-instance 'status))
   (anatomy :accessor anatomy :initarg :anatomy)))

(defclass plant (organism)
  ())

(defclass fungus (organism)
  ())

(defclass lichen (plant fungus)
  ())

(defclass creature (organism mobile)
  ())

(defclass mammal () ())

(defclass humanoid (creature)
  ())

(defclass human (humanoid mammal melee-attacker)
  ())

(defclass goblin (humanoid mammal melee-attacker)
  ())
