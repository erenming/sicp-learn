(define (cont-frac n d k)
    (define (f i result)
        (if (= i k) result
            (f (+ i 1)
                (f (+ i 1) (/ (n (- k i)) (+ (d (- k 1)) result)))
            )
    ))
    (f 0 0))

(define (theta k)
    (cont-frac (lambda (i) 1.0)
            (lambda (i) 1)
            k))
