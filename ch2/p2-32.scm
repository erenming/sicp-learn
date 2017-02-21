(load "lsit.scm")

(define (subsets s)
    (if (null? s)
        (list nil)
        (let ((rest (subsets (cdr s))))
            (append rest
                    (map ))
        )
    )
)
