(define (make-accumulator result)
    (lambda (x)
        (begin (set! result (+ result x)) result))
)
