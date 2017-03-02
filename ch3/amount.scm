(define withdraw
    (let ((balance 100))
        (lambda (amount)
            (if (>= balance amount)
                (begin (set! balance (- balance amount)) balance)
                "Insufficient funds")))
)

(define (make-withdraw balance)
    (lambda (amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount)) balance)
            "Insufficient funds")))

(define (make-account balance)
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount)) balance)
            "Insufficient funds"))
    (define (deposit amount)
        (begin (set! balance (+ balance amount))
        balance))
    (define (dispatch m)
        (cond
            ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unkonwn request -- MAKE-ACCOUNT" m))))
    dispatch
)
