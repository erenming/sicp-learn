(load "stream.scm")

(define (partial-sums s)
    (cons-stream (stream-car s) (add-streams (partial-sums s) (stream-cdr s)))
)
