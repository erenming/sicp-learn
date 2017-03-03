(define (append! x y)
    (set-cdr! (last-pair x) y) x
)

(define (last-pair x)
    (if (null? (cdr x))
        x
        (last-pair (cdr x)))
)

(define (append x y)
    (if
        (null? x)
        y
        (cons (car x) (append (cdr x) y)))
)

(define x (list 'a 'b))
