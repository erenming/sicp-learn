(define (=zero? x) (apply-generic '=zero? x))

;; add into scheme number
(put '=zero? 'scheme-number (lambda (x) (= x 0)))

;; add into rational-number-package
(put '=zero? 'rational-number (lambda (x) (= (numer x) 0)))

;; add into complex-number-package
(put '=zero? 'complex-number
    (lambda (x) (= (real-part x) (imag-part x) 0)))
