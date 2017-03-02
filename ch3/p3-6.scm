(define (random-init) 0)
(define (rand-update x) (+ x 1))
(define rand
    (let ((x random-init))
        (define (dispatch message)
            (cond
                ((eq? message 'generate)
                    (begin (set! x (rand-update x)) x))
                ((eq? message 'reset) (lambda (value) (set! x value) x)))
        )
        dispatch
    )
)
