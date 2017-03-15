(load "stream.scm")

(define (mul-steams s1 s2)
    (stream-map * s1 s2)
)

(define (add-streams s1 s2)
    (stream-map + s1 s2))

(define integers (cons-stream 1 (add-streams ones integers)))

(define factorials (cons-stream 1 (mul-steams factorials (stream-cdr integers   )))
