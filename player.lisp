(load "entities.lsp")
(load "aspects.lsp")
(load "rules.lsp")

(defclass player ()
  ((entity :accessor entity
           :initarg :entity
           :initform (make-instance 'human))))
