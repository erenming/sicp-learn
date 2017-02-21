(load "p2-36.scm")

(define seqs (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9  )))

(define (dot-product v w)
    (accumulate + 0 (map * v w))
)

(define (matrix-*-vector m v)
    (map (lambda (m-row) (dot-product m-row v)) m)
)

(define (transpose mat)
    (accumulate-n cons nil mat)
)

(define (matrix-*-matrix m n)
    (let ((cols (transpose n)))
        (map (lambda (col-of-m)
                (map (lambda (col-of-cols)
                        (dot-product col-of-m col-of-cols))
                    cols))
                m)
    )
)
