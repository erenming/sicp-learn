(load "square.scm")

(define (compose f g)
    (lambda (x) (f (g x)))
)

(define (inc x)
    (+ 1 x)
)
