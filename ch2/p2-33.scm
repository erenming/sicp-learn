(load "module.scm")

(define (map p sequence)
    (accumulate
        (lambda (x y) (cons (p x) y))
        nil
        sequence
    )
)

(define (append seq1 seq2)
    (accumulate cons seq1 seq2)
)

(define (length sequence)
    (accumulate
        (lambda (x already-acc)
            (+ 1 already-acc)
        )
        0
        sequence)
)
