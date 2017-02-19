(define (cont-frac n d k)
    (define (f i)
        (/ (n i)
            (+ (d i)
            (if (= i k) 0 (f (+ i 1)))))
        )
    (f 1)
)


(define (theta k)
    (cont-frac (lambda (i) 1.0)
            (lambda (i) 1)
            k))
