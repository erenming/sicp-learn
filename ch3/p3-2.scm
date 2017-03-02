(define (make-monitored f)
    (let ((count 0))
        (define (dispatch m)
            (cond
                ((eq? m 'how-many-calls?) count)
                ((eq? m 'reset-count) (set! count 0) count)
                (else (set! count (+ 1 count)) (f m))
                )
        )
        dispatch
))
