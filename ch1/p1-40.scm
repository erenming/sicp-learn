(load "newtons-method.scm")
(load "square.scm")
(load "cube.scm")


(define (cubic a b c)
    (lambda (x)
        (+ (cube x) (* a (square x)) (* b x) c)
    )
)

(define (zero a b c)
    (newtons-method (cubic a b c) 1.0)
)
