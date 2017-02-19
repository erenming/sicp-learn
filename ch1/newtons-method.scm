(load "fixed-point.scm")

(define (deriv g)
    (lambda (x)
        (/ (- (g (+ x dx)) (g x)) dx)))

(define (dx) 0.00001)

(define (newtons-transform g)
    (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
    (fixed-point (newtons-transform g) guess))

(define (sqrt x)
    (newtons-method (lambda (y) (- (square y) x)) 1))
