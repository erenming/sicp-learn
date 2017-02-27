(make-from-real-imag (real-part z) (imag-part z))

(make-from-mag-ang (magnitude z) (angle z))

(define (add-complex z1 z2)
    (make-from-real-image (+ (real-part z1) (real-part z2))
                          (+ (imag-part z1) (imag-part z2)))
)

(define (sub-complex z1 z2)
    (make-from-real-image (- (real-part z1) (real-part z2))
                          (- (imag-part z1) (imag-part z2))))

(define (mul-complex z1 z2)
    (make-from-mag-ang (* (magnitude z1) (magnitude z2))
                       (+ (angle z1) (angle z2))))

(define (mul-complex z1 z2)
   (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
                      (- (angle z1) (angle z2))))


(define (square x) (* x x))

; Ben version
(define (real-part z) (car z))

(define (imag-part z) (car z))

(define (magnitude z)
    (sqrt (+ (square (real-part z)) (sqaure (imag-part z)))))

(define (angle z)
    (atan (imag-part z) (real-part z))
)

(define (make-from-imag x y) (cons x y))

(define (make-from-mag-ang r a)
    (cons (* r (cos a)) (* (sin a)))
)

; Alyssa version
(define (real-part z) (* (magnitude z) (cos (angle z))))

(define (real-part z) (* (magnitude z) (sin (angle z))))

(define (magnitude z) (car z))

(define (angle z) (cdr z))

(define (make-from-real-imag x y)
    (cons (sqrt (+ (square x) (square y))) (atan y x))
)

(define (make-from-mag-ang r a) (cons r a))
