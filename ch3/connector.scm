; 创建连接器C F,并链接到网络中
(define C (make-connector))
(define F (make-connector))
(celsius-fahrenheit-converter C F)

; 关系网络
(define (celsius-fahrenheit-converter c f)
    (let ((u (make-connector))
        (v (make-connector))
        (w (make-connector))
        (x (make-connector))
        (y (make-connector)))

        (multiplier c w u)
        (multiplier v x u)
        (adder v y f)
        (constant 9 w)
        (constant 5 x)
        (constant 32 y)
        'ok
    )
)

; 为C F安装监视器
(probe "Celsius temp" C)
(probe "Fahrenheit temp" F)
; 将C设置为25
(set-value! C 25 'user)
; 将F设置为212
(set-value! F 212 'user)


; 加法约束
(define (adder a1 a2 sum)
    (define (process-new-value)
        (cond
            ((and (has-value? a1) (has-value? a2))
                (set-value! sum
                    (+ (get-value a1) (get-value a2)) me))
            ((and (has-value? a1) (has-value? sum))
                (set-value! a2
                    (- (get-value sum) (get-value a1)) me))
            ((and (has-value? a2) (has-value? sum))
                (set-value! a1
                    (- (get-value sum) (get-value a2)) me))
    ))

    (define (process-forget-value)
        (forget-value sum me)
        (forget-value a1 me)
        (forget-value a2 me)
        (process-new-value))

    (define (me request)
        (cond
            ((eq? request 'I-have-a-value) (process-new-value))
            ((eq? request 'I-lost-my-value) (process-forget-value))
            (else "Uknown request -- ADDER" request))
    )
    (connect a1 me)
    (connect a2 me)
    (connect sum me)
    me
)
; 语法界面
(define (inform-about-value constraint)
    (constraint 'I-have-a-value))
(define (inform-about-no-value constraint)
    (constraint 'I-lost-my-value))

; 乘法约束
(define (multiplier m1 m2 product)
    (define (process-new-value)
        (cond
            ((or (and (has-value? m1) (= (get-value m1) 0)))
                (and (has-value? m2) (= (get-value m2) 0))
                (set-value! product 0 me))
            ((and (has-value? m1) (has-value? m2))
                (set-value! product
                            (* (get-value m1) (get-value m2)) me))
            ((and (has-value? product) (has-value? m1))
                (set-value! m2
                            (/ (get-value product) (get-value m1))))
            ((and (has-value? product) (has-value? m2))
                (set-value! m1
                            (/ (get-value product) (get-value m2))))
        )
    )
    (define (process-forget-value)
        (forget-value! product me)
        (forget-value! m1 me)
        (forget-value! m2 me)
        (process-new-value))
    (define (me request)
        (cond
            ((eq? request 'I-have-a-value) (process-new-value))
            ((eq? request 'I-lost-my-value) (process-forget-value))
            (else "Uknown request -- MULTIPLIER" request))
    )
    (connect m1 me)
    (connect m2 me)
    (connect product me)
    me
)

; 常量约束
(define (constant value connector)
    (define (me request)
        (error "Unkonwn request -- CONSTANT" request))
    (connect connector me)
    (set-value! connector value me)
    me)

; 监视器
(define (probe name connector)
    (define (print-probe value)
        (newline)
        (display "Probe: ")
        (display name)
        (display " = ")
        (display value))
    (define (process-new-value)
        (print-probe (get-value connector)))
    (define (process-forget-value)
        (print-probe "?"))
    (define (me request)
        (cond
            ((eq? request 'I-have-a-value) (process-new-value))
            ((eq? request 'I-lost-my-value) (process-forget-value))
            (else "Uknown request -- PROBE" request))
    )
    (connect connector me)
    me
)

; 连接器
(define (make-connector)
    (let ((value false) (informant false) constraints '())
        (define (set-my-value newval setter)
            (cond
                ((not (has-value? me))
                    (set! value newval)
                    (set! informant setter)
                    (for-each-except setter
                                    inform-about-value
                                    constraints))
                ((not (= value newval))
                    (error "Contradiction" (list value newval)))
                (else 'ignored)))

        (define (forget-my-value retractor)
            (if (eq? retractor informant)
                (begin (set! informant false)
                        (for-each-except retractor
                                        inform-about-no-value
                                        constraints)
                                        )'ignored))

        (define (connect new-constraint)
            (if (not (memq new-constraint constraints))
                (set! constraints
                        (cons new-constraint constraints)))
            (if (has-value? me)
                (inform-about-value new-constraint))
            'done)
        (define (me request)
            (cond
                ((eq? request 'has-value?) (if informant true false))
                ((eq? request 'value) value)
                ((eq? request 'set-value!) set-my-value)
                ((eq? request 'forget-my-value))
                ((eq? request 'connect) connect)
                (else (error "Unkonwn operation -- CONNECTOR" request))))
    )
)

(define (for-each-except exception procedure list)
    (define (loop items)
        (cond
            ((null? items) 'done)
            ((eq? (car items) exception) (loop (cdr items)))
            (else (procedure (car items))
                    (loop (cdr items)))))
    (loop list)
)
; 连接器的语法界面
(define (has-value? connector)
    (connector 'has-value?))
(define (get-value connector)
    (connector 'value))
(define (set-value! connector new-value informant)
    ((connector 'set-value!) new-value informant))
(define (forget-value! connector retractor)
    ((connector 'forget-value) retractor))
(define (connect connector new-constraint)
    ((connector 'connect) new-constraint))
