(load "p2-2.scm")

(define (make-rectangle length width)
    (cons length width)
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
