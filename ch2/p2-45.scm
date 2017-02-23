(define (split pro1 pro2)
    (lambda (painter n)
        (if (= n 0)
            painter
            (let ((smaller (split painter (- n 1))))
                (pro1 painter (pro2 smaller smaller))
            )
        )))
