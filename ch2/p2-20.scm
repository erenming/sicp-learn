(load "list.scm")

(define (same-parity first . rest)
    (let
        ((yes? (if (even? first) even? odd?)))
        (define (iter items result)
            (if (null? items)
                (reverse result)
                (iter (cdr items)
                    (if (yes? (car items))
                        (cons (car items) result)
                        (result))
                )
        ))
        (iter rest (list first))
    )
)

有bug
