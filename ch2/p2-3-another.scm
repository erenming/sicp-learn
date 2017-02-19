(load "p2-2.scm")

(define (make-rectangle left-bottom seg1 seg2)
    (define (abs x) (if (x < 0) (- x) x))
    (cons
        (abs (- (x-point (end-segment seg1)) (x-point left-bottom)))
        (abs (- (y-point (end-segment seg2)) (y-point left-bottom)))
    )
)

(define (length-rec rec)
    (car rec)
)

(define (width-rec rec)
    (cdr rec)
)

(define (girth rec)
    (let
        (
        (length (length-rec rec))
        (width (width-rec rec))
        )
        (* 2 (+ length width))
    )
)

(define (area rec)
    (let
        ((length (length-rec rec))
        (width (width-rec rec)))
        (* length width)
    )
)
