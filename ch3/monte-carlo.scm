(define (estimate-pi trials)
    (sqrt (/ 6 (monte-carlo trials cesaro-test)))
)

(define (cesaro-test)
    (= (gcd (rand) (rand)) 1))

(define (monte-carlo trials experiment)
    (define (iter trials-remaining trials-passed)
        (cond
            ((= trials-remaining 0)
                (/ trials-passed trials))
            ((experiment)
                (iter (- trials-remaining 1) (+ 1 trials-passed)))
            (else
                (iter (- trials-remaining 1) trials-passed))
        ))
    (iter trials 0)
)
