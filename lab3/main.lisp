(defun swap-rows (matrix i j)
              (loop with n = (array-dimension matrix 1)
                    for k upfrom 0 below n do 
                    (rotatef (aref matrix i k) (aref matrix j k)))
              matrix)

(defun swap-cols (matrix i j)
              (loop with n = (array-dimension matrix 0)
                    for k upfrom 0 below n do
                    (rotatef (aref matrix k i) (aref matrix k j)))
              matrix)

(defun pos-of-min (matrix)
    (let ((min-row-pos 0) (min-column-pos 0) (min-elem (aref matrix 0 0)))
        (loop with n = (array-dimension matrix 0)
            for i upfrom 0 below n do
            (loop with m = (array-dimension matrix 1) 
            for j upfrom 0 below m do
                (cond ((< (aref matrix i j) min-elem) 
                       (setf min-elem (aref matrix i j) min-row-pos i min-column-pos j)))))
        (values min-row-pos min-column-pos))) 





(defun copy-array (array) 
    (adjust-array array (array-dimensions array)))




(defun swap-min-to-bottom-left (matrix)
    (let ((new-matrix (copy-array matrix)))
        (multiple-value-bind (i j) (pos-of-min matrix) 
          (swap-rows new-matrix (- (array-dimension matrix 1) 1) i)
          (format t "Меняем местами строки ~d и ~d" (- (array-dimension matrix 1) 1) i)
          (swap-cols new-matrix 0 j)
          (format t "~%Меняем местами столбцы ~d и ~d" 0 j))
     new-matrix))



(defun print-matrix (matrix &optional (chars 3) stream)
    (let ((*print-right-margin* (+ 6 (* (1+ chars) 
                                        (array-dimension matrix 1)))))
        (pprint matrix stream)
        (values)))





