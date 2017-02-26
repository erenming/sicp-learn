(load "ordered-set.scm")

(define (union-set set1 set2)
    (if (or (null? set1) (null? set2))
        (append set1 set2)
        (let
            ((x1 (car set1)) (x2 (car set2)))
            ((= x1 x2) (union-set (cdr set1) (cdr set2)))
            ((< x1 x2) (cons x1 (union-set (cdr set1) set2)))
            ((< x2 x1) (cons x2 (union-set set1 (cdr set2))))
        )
    )
)
