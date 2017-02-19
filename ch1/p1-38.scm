(load "p1-37.scm")

(define (d i)
    (let ((flag (remainder i 3)))
        (if (= flag 2) (* (/ 2 3) (+ i 1)) 1
        )
    )
)

(define (new-D i)
    (if (= 0 (remainder (+ i 1) 3))
        (* 2 (/ (+ i 1) 3))
        1))

(define (oula k)
    (+ 2 (cont-frac
        (lambda (i) 1.0)
        new-D
        k
        )))
