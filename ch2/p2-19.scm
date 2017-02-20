(load "list.scm")

(define us-coins (list 50 25 10 5 1))

(define (cc amount coin-values)
    (cond
        ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
            (+ (cc amount (except-first-denomination coin-values))
               (cc (- amount (first-denomination coin-values)) coin-values))
        )
    )
)

(define (no-more? items)
    (= (length items) 0)
)

(define (except-first-denomination items)
    (cdr items)
)

(define (first-denomination items)
    (car items)
)
