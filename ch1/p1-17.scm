(define (mul-iter b a)
    (cond
        ((= 0 a) 0)
        ((even? a) (double (mul-iter b (halve a))))
        ((odd? a) (+ b (mul-iter b (- a 1))))
        ))

(define (double x)
    (+ x x))

(define (halve x)
    (/ x 2))


; tail recursion version
(define (fast-mult-by-add a b)
    (define (double x) (+ x x))
    (define (halve x) (/ x 2))

    (define (helper a b product)
        (cond
            ((= b 0) product)
            ((even? b) (helper (double a) (halve b) product))
            ((odd? b) (helper a (- b 1) (+ product a)))))
    (helper a b 0))
