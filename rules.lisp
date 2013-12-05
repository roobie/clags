
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

(defclass trauma () ())

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
     (trauma :accessor trauma
             :initarg :trauma
             :initform (make-instance 'trauma))))

(defclass damage ()
  (type :accessor type
        :initarg :type))

