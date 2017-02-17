(load "p1-21.scm")

(define (filtered-accumulate combiner null-value term a next b filter)
        (define (iter a result)
            (if (> a b) result
                (if (filter a) (iter (next a) (combiner (term a) result))
                    (iter (next a) result)
                )))
        (iter a null-value)
)

(define (sum-of-primer a b) (filtered-accumulate + 0 (lambda (x) x) a (lambda (x) (+ x 1)) b prime?))
