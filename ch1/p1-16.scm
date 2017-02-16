(define (fast-expt b n)
    (expt-iter b n 1))

(define (expt-iter b n a)
    (cond
        ((= n 0) a)
        ((even? n) (expt-iter (* b b) (/ n 2) a))
        ((odd? n) (expt-iter b (- n 1) (* a b) ) )))
