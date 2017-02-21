(load "list.scm")

; filter a sequence
(define (filter predicate sequence)
    (cond
        ((null? sequence) nil)
        ((predicate (car sequence))
            (cons (car sequence)
                  (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))


; accumulate a sequence
(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence) (accumulate op initial (cdr sequence)))
    )
)

; enumerate interval sequence
(define (enumerate-interval low high)
    (if (> low high)
        nil
        (cons low (enumerate-interval (+ low 1) high))))

; enumerate tree
(define (enumerate-tree tree)
    (cond
        ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))
    )
)
