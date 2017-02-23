(load "painter.scm")

(define (up-split )
    (if (= n 0)
        painter
        (let ((smaller (up-split painter (- n 1))))
            (below painter (beside smaller smaller))
        )
    )
)
