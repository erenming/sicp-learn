; 半加器
(define (half-adder a b s c)
    (let ((d (make-wire)) (e (make-wire)))
        (or-gate a b d)
        (and-gate a b c)
        (inverter c e)
        (and-gate d e s)
        'ok
    ))
; 全加器
(define (full-adder a b c-in sum c-out)
    (let ((s (make-wire))
        (c1 (make-wire))
        (c2 (make-wire)))
        (half-adder b c-in s c1)
        (half-adder a s sum c2)
        (or-gate c1 c2 c-out)
        'ok
    )
)

; 反门
(define (inverter input output)
    (define (invert-input)
        (let ((new-value (logical-not (get-signal input))))
            (after-delay inverter-delay
                (lambda ()
                    (set-signal! output new-value)))
        ))
    (add-action! input invert-input) 'ok
)
; 逻辑否
(define (logical-not s)
    (cond
        ((= s 0) 1)
        ((= s 1) 0)
        (else (error "Invalid signal" s)))
)

; 与门
(define (and-gate a1 a2 output)
    (define (and-action-procedure)
        (let ((new-value
            (logical-and (get-signal a1) (get-signal a2))))
            (after-delay add-gate-delay
                (lambda ()
                    (set-signal! output value)))
        ))
    (add-action! a1 and-action-procedure)
    (add-action! a2 and-action-procedure)
    'ok
)

; 创建线路
(define (make-wire)
    (let ((signal-value 0) (action-procedures '()))
        ; 设置信号
        (define (set-my-signal! new-value)
            (if (not (= signal-value new-value))
                (begin (set! signal-value new-value)
                        ; 调用过程集中的每个过程
                        (call-each action-procedures))
                'done))
        (define (call-each procedures)
            (if (null? procedures)
                'done
                (begin ((car procedures))
                    (call-each (cdr procedures))))
        )

        ; 添加新过程到过程集
        (define (accept-action-procedure! proc)
            (set! action-procedures (cons proc action-procedures))
            (proc))

        (define (dispatch m)
            (cond
                ((eq? m 'get-signal) signal-value)
                ((eq? m 'set-signal) set-my-signal!)
                ((eq? m 'add-action) accept-action-procedure!)
                (else (error "Unkonwn operation -- WIRE" m)))
        )
        dispatch
    )
)
(define (get-signal wire)
    (wire 'get-signal))
(define (set-signal! wire new-value)
    ((wire 'set-signal) new-value))
(define (add-action! wire action-procedure)
    ((wire 'add-action) action-procedure))
