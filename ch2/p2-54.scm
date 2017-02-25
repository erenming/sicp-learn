(define (equal? a b)
    (cond
        ((and (pair? a) (pair? b))
            (if (eq? (car a) (car b)) (equal? (cdr a) (cdr b)) #f))
        (else
            (if (eq? a b) #t #f)
        )
    )
)
