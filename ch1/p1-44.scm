(load "p1-43.scm")

(define (smooth f)
    (lambda (x)
        (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)
    )
)

(define (smooth-n f n x)
    ((repeated (smooth f) n) x)
