(define (stream-limit s limit)
    (let ((first (stream-car s))
          (second (stream-car (stream-cdr s))))
        (if (close_enough? first second limit)
            second
            (stream-limit (stream-cdr s) limit))
    )
)

(define (close_enough? a b limit)
    (< abs((- a b))
        limit)
)
