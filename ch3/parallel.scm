(define x 10)
(define s (make-serializer))
(parallel-execute (s (lambda () (set! x (* x x))))
                  (s (lambda () (set! x (+ x 1)))))

(define (make-count balance)
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
                    balance)
            "Insufficient funds"))
    (define (deposit amount)
        (set! balance (+ balance amount)))

    (let ((protected (make-serializer)))
        (define (dispatch m)
            (cond
                ((eq? m 'withdraw) (protected withdraw))
                ((eq? m 'deposit) (protected deposit))
                ((eq? m 'balance) balance)
                (else (error "Unkonwn request -- MAKE-ACCOUNT" m))))
        dispatch))

; 多资源共享情况
(define (make-account-and-serializer balance)
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
                    balance)
            "Insufficient funds"))
    (define (deposit amount)
        (set! balance (+ balance amount)))

    (let ((balance-serializer (make-serializer)))
        (define (dispatch m)
            (cond
                ((eq? m 'withdraw) withdraw)
                ((eq? m 'deposit) deposit)
                ((eq? m 'balance) balance)
                ((eq? m 'serializer) balance-serializer)
                (else (error "Unkonwn request -- MAKE-ACCOUNT" m))))
        dispatch
    )
)
; interface
(define (deposit account amount)
    (let ((s (account 'serializer)
          (d (account 'deposit))))
        ((s d) amount)))

; 转账
(define (serialized-exchange amount1 amount2)
    (let ((serializer1 (account1 'serializer))
          (serializer2 (account2 'serializer)))
        ((serializer1 (serializer2 exchange)))
        )
)


; 串行化的实现
(define (make-serializer)
    (let ((mutex (make-mutex)))
        (lambda (p)
            (define (serialized-p . args)
                (mutex 'acquire)
                (let ((val (apply p args)))
                    (mutex 'release)
                    val)
            )
            serialized-p
            )))

; 构造互斥锁
(define (make-mutex)
    (let ((cell (list false)))
        (define (the-mutex m)
            (cond
                ((eq? m 'acquire)
                    (if (test-and-set! cell)
                        (the-mutex 'acquire)))
                ((eq? m 'release) (clear! cell))))
        the-mutex
    )
)
(define (clear! cell)
    (set-car! cell false))
(define (test-and-set! cell)
    (without-interrupts
        (lambda ()
            (if (car cell)
                true
                (begin (set-car! cell true) false)))))
