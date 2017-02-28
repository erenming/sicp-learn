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
(define (real-part-rectangular z) (car z))

(define (imag-part-rectangular z) (car z))

(define (magnitude-rectangular z)
    (sqrt (+ (square (real-part z)) (sqaure (imag-part z)))))

(define (angle-rectangular z)
    (atan (imag-part-rectangular z) (real-part-rectangular z))
)

(define (make-from-imag-rectangular x y) (attach-tag 'rectangular (cons x y)))

(define (make-from-mag-ang-rectangular r a)
    (attach-tag 'rectangular (cons (* r (cos a)) (* (sin a))))
)

; Alyssa version
(define (real-part-polar z) (* (magnitude z) (cos (angle z))))

(define (real-part-polar z) (* (magnitude z) (sin (angle z))))

(define (magnitude-polar z) (car z))

(define (angle-polar z) (cdr z))

(define (make-from-real-imag-polar x y)
    (attach-tag 'polar (cons (sqrt (+ (square x) (square y))) (atan y x))
)

(define (make-from-mag-ang-polar r a) (attach-tag 'polar (cons r a)))

; data with tag
(define (attach-tag type-tag contents)
    (cons type-tag contents)
)

(define (type-tag data)
    (if (pair? data)
        (car data)
        (error "Bad tagged data -- TYPE-TAG" data)))

(define (contents data)
    (if (pair? data)
        (cdr data)
        (error "Bad tagged data -- CONTENTS" data)))


(define (rectangular? z)
    (eq? (type-tag z) 'rectangular))

(define (polar? z)
    (eq? (type-tag z) 'polar))


; general select function
(define (real-part z)
    (cond
        ((rectangular? z) (real-part-rectangular (contents z)))
        ((polar? z) (real-part-polar (contents z)))
        (else (error "Unkonwn type -- REAL-PART" z))))

(define (imag-part z)
    (cond
        ((rectangular? z) (imag-part-rectangular (contents z)))
        ((polar? z) (imag-part-polar (contents z)))
        (else (error "Unkonwn type -- IMAG-PART" z))))

(define (magnitude z)
    (cond
        ((rectangular? z) (magnitude-rectangular (contents z)))
        ((polar? z) (magnitude-polar (contents z)))
        (else (error "Unknown type -- MAGNITUDE" z))
    )
)

(define (angle z)
    (cond
        ((rectangular? z) (angle-rectangular (contents z)))
        ((polar? z) (angle-polar (contents z)))
        (else (error "Unknown type -- ANGLE" z))
    )
 )


; general format function
(define (make-from-real-imag x y)
    (make-from-real-imag-rectangular x y))

(define (make-from-mag-ang r a)
    (make-from-mag-ang-polar r a))
