(load "list.scm")

(define (deep-reverse x)
    (cond
        ((not (pair? (car x))) (reverse x))
        (else (list (deep-reverse (cdr x))
                    (deep-reverse (car x))))
    )

)
