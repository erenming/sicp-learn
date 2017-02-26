(load "ordered-set.scm")

(define (adjoin-set x set)
    (cond
        ((null? set) (list x))
        (let
            ((first (car set)))
            (cond
                ((= x first) set)
                ((< x first) (cons x set))
                ((> x first) (cons (car set) (adjoin-set x (cdr set))))
            )
        )
    )
)
