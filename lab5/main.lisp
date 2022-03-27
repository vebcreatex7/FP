(defclass cart ()  
 ((x :initarg :x :reader cart-x)   
  (y :initarg :y :reader cart-y))) 



(defmethod print-object ((c cart) stream)
  (format stream "[CART x ~d y ~d]"
          (cart-x c) (cart-y c)))


(defclass line ()
 ((start :initarg :start :accessor line-start)
  (end   :initarg :end   :accessor line-end)))

(defmethod print-object ((lin line) stream)
  (format stream "[ОТРЕЗОК ~s ~s]"
          (line-start lin) (line-end lin)))



(defmethod line-length ((l line))
    (let ((c1 (line-start l))
          (c2 (line-end l)))
      (sqrt (+ (* (- (cart-x c1) (cart-x c2)) (- (cart-x c1) (cart-x c2)))
              (* (- (cart-y c1) (cart-y c2)) (- (cart-y c1) (cart-y c2)))
              )
            )
      )
    )




