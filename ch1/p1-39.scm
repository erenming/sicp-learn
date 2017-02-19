(load "p1-37.scm")
(load "square.scm")

(define (tan-cf x k)
    (define (d i) (- (* 2 i) 1))
    (define (n i)
        (if (= i 1) x (- (square x))))

    (exact->inexact (cont-frac n d k))
)

(define (tan-cff x k)

    (define (N i)
        (if (= i 1)
            x
            (- (square x))))

    (define (D i)
        (- (* i 2) 1))

    (exact->inexact (cont-frac N D k)))
