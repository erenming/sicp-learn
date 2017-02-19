(load "fixed-point.scm")
(load "avarage.scm")

(define (f)
    (fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0))


(define (f-avg)
    (fixed-point (lambda (x) (avarage x (/ (log 1000) (log x)))) 2.0))
