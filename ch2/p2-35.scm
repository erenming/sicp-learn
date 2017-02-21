(load "module.scm")

(define (count-leaves t)
    (accumulate + 0
        (map (lambda (node) (if (not (pair? node)) 1 (count-leaves node))) t))
)
