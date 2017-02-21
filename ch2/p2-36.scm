(load "module.scm")

(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        nil
        (cons (accumulate op init (select-cars seqs))
              (accumulate-n op init (select-cdrs seqs)))
    )
)

(define (select-cars seqs)
    (map car seqs))

(define (select-cdrs seqs)
    (map cdr seqs))
