(load "p1-21.scm")

(define (time-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time))))

(define (report-prime elasped-time)
    (display " *** ")
    (display elasped-time))

(define (search-for-primes x y)
    (cond ((> x y) (display "no prime between two numbers"))
        ((even? x) (search-for-primes (+ x 1) y))
        (else (if (prime? x) x (search-for-primes (+ x 1) y)))
    ))
