(load "p2-7.scm")

(define (div-interval a b)
    (if
        (<= (* (lower-bound y) (upper-bound y)))
        (error "divsior can not span zero")
        (mul-interval x
            (make-interval (/ 1.0 (upper-bound y))
                           (/ 1.0 (lower-bound y)))
        )
    )
)
