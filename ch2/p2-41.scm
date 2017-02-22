(load "module.scm")

(define (ordered-triples-sum n s)
    (filter (lambda (item) (= (accumulate + 0 item) s))
        (triples-pairs n)
    )
)


(define (triples-pairs n)
    (flatmap
        (lambda (i)
            (flatmap (lambda (j)
                (map (lambda (k) (list i j k))
                    (enumerate-interval 1 (- j 1))
                )
            )
            (enumerate-interval 1 (- i 1))
            )
        )
    (enumerate-interval 1 n)
    )
)
