(load "p2-7.scm")

(define (make-center-percent c p)
    (make-interval
        (* c (- 1 (/ p 100)))
        (* c (+ 1 (/ p 100)))
    )
)

(define (center i)
    (/ (+ (lower-bound i) (upper-bound i)) 2)
)

(define (percent i)
    (* (- (upper-bound i) (center i)) 100)
)
