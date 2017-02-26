(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
    (list entry lefit right))

(define (element-of-set? x set)
    (cond
        ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set)) (element-of-set? x (left-branch set)))
        ((> x (entry set)) (element-of-set? x (right-branch set)))
    )
)

(define (adjoin-set x set)
    (cond
        ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
            (make-tree (entry tree) (adjoin-set x (left-branch tree)) (right-branch tree))
        )
        ((> x (entry set))
            (make-tree (entry tree) (left-branch tree) (adjoin-set x (right-branch tree)))
        )
    )
)
