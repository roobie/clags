
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

(defgeneric tick (entity world)
  (:documentation "Go through a `tick` for a certain entity instance"))

(defmethod tick ((entity entity) world)
  world)

(defclass thing (entity)
  ())

(defmethod tick ((thing thing) world)
  world)

(defclass undead (entity mobile destructible)
  ())

(defclass organism (entity killable grower)
  ())

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
  ((status :accessor status
           :initarg :status
           :initform (make-instance 'status
                                    :anatomy (make-instance 'anatomy
                                                            :body-parts (list (make-instance 'body-part
                                                                                             :muscles (list (make-instance 'muscle)))))))))

(defclass human (humanoid mammal melee-attacker)
  ())

(defclass goblin (humanoid mammal melee-attacker)
  ())
