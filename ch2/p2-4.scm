(define (cons x y)
    (lambda (m) (m x y))
)

(define (car z)
    (z (lambda (p q) p))
)

(define (cdr z)
    (z (lambda (p q) q))
)


(car (cons x y)) = (car (lambda (m) (m x y))) = ((lambda ((lambda (p q) q)) ((lambda (p q) q) x y)))
    = (lambda (x y) y) = y
