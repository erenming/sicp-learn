(load "wire.scm")

; 或门
(define (or-gate a1 a2 output)
    (define (or-action-procedure)
        (let ((new-value
            (logical-or (get-signal a1) (get-signal a2))))
            (after-delay or-gate-delay
                (set-signal! output value))
        ))
    (add-action! a1 and-action-procedure)
    (add-action! a2 and-action-procedure)
    'ok
)
