(load "list.scm")

(define (reverse x)
    (define (iter x acc)
        (if (null? x)
            acc
            (iter (cdr x) (cons (car x) acc))
        )
    )
    (iter x nil)
)

(define (fringe items)
    (define (collect stack acc)
        (if (null? stack) acc
            (let ((top (car stack)))
                (cond
                    ((null? top) (collect (cdr stack) acc))
                    ((not (pair? top)) (collect (cdr stack) (cons top acc)))
                    (else (collect (cons (car top) (cons (cdr top) (cdr stack))) acc))
                )
            )
        )
    )
    (reverse (collect (list items) nil))
)
