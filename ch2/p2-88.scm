(define (negate x) (apply-generic 'negate x))

; add into scheme-number package
(put 'negate 'scheme-number
    (lambda (n) (tag (- n))))
; add into rational-number package
(put 'negate 'rational-number
    (lambda (rat) (make-rational (- (numer rat)) (denom rat))))
; add into complex-number package
(put 'negate 'complex-number
    (lambda (z) (make-from-real-image (- (real-part z)) (- (imag-part z)))))

; add into polynomial
(define (negate-terms termlist)
    (if (empty-termlist? termlist)
        the-empty-termlist
        (let ((t (first-term termlist)))
            (adjoin-term
                (make-term (order t) (negate (coeff t)))
                (negate-terms (rest-terms termlist))))))
(put 'negate 'polynomial
    (lambda (poly) (make-polynomial (variable poly)
                                    (negate-terms (term-list poly)))))
(put 'sub 'polynomial
    (lambda (x y) (tag (add-poly x (negate y)))))
