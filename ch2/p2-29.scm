(define (make-mobile left right)
    (list left right)
)

(define (make-branch length structure)
    (list length structure)
)

(define (left-branch mobile)
    (car mobile)
)

(define (right-branch mobile)
    (cdr mobile)
)

(define (branch-length branch)
    (car branch)
)

(define (branch-structure branch)
    (car (cdr branch))
)

(defien (is-mobile? structure)
    (pair? structure)
)



(define (total-weight mobile)
    (define (branch-weight branch)
        (let ((s (branch-structure branch)))
            (if (is-mobile? s)
                (total-weight s)
                s)))

    (+ (branch-weight (left-branch mobile))
        (branch-weight (right-branch mobile)))
)
