(load "list.scm")

(define (square x) (* x x))

(define (square-list items)
    (if (null? items)
        nil
        (cons (square (car items)) (square-list (cdr items)))
    )
)

; map version
(define (square-list items)
    (map square  items)
)
