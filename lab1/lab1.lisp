    
(defun first-digit (x)
    (if (< x 10) 
        x 
        (first-digit (floor x 10))
    )
)