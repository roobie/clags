(load "rules.lsp")

(defclass mobile () ())

(defgeneric move (mobile destination world)
  (:documentation "Move the `mobile` to `destination` (point) in `world`"))

(defgeneric can-move? (mobile destination world)
  (:documentation
   "Interrogate whether the mobile can move
and can move to destination in the world"))

(defclass killable () ())

(defgeneric sustain-damage (killable damage))

(defclass destructible () ())

(defclass melee-attacker () ())

(defclass grower () ())
