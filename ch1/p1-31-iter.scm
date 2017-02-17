
(define (product term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (+ a 1)
                  (* (term a) result))))
    (iter a 1))

(define (numer-term i)
    (cond ((= i 1) 2)
        ((even? i) (+ i 2))
        (else (+ i 1))))

(define (denom-term i)
    (cond ((odd? i) (+ i 2))
        (else (+ i 1))))

(define (pi n)
    (* 4.0
        (/ (product numer-term 1 (lambda (i) (+ i 1)) n)
            (product denom-term 1 (lambda (i) (+ i 1)) n)
        )
))
