(load "list.scm")

(define (tree-map tree f)
    (cond
        ((null? tree) nil)
        ((not (pair? tree)) (f tree))
        (else (cons (tree-map (car tree) f)
                    (tree-map (cdr tree) f)))
    )
)

; better
(define (tree-map proc tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (tree-map proc sub-tree)
           (proc sub-tree)))
       tree))

(define (square-tree tree) (tree-map tree square))

(define (square x) (* x x))
