(load "aspects.lsp")
(load "rules.lsp")

(defclass entity ()
  ((location :accessor location
             :initarg :location
             :initform '(0 0))
   (weight :accessor weight
           :initarg :weight
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
  ())

(defclass human (humanoid mammal melee-attacker)
  ())
