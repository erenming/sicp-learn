(load "list.scm")

(define x (list (list 1 2) (list 3 4)))

(define (deep-reverse items)
    (define (deep-rev-imp items result)
        (if (null? items)
            result
            (let ((first (car items)))
                (deep-rev-imp (cdr items)
                                (cons (if (not (pair? first))
                                          first
                                          (deep-reverse first))
                                    result))
            )
        )
    )
    (deep-rev-imp items nil)
)
