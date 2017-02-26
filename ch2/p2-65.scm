(load "p2-63.scm")
(load "p2-64.scm")
(load "p2-62.scm")

(define (union-set-tree tree1 tree2)
    (list->tree (union-set (tree->list1 tree1) (tree->list2 tree2)))
)

(define (intersection-set-tree tree1 tree2)
    (list->tree (intersection-set (tree->list1 tree1) (tree->list1 tree2)))
)
