(define S
    (cons-stream 1 (merge (merge (scale-stream 2) (scale-stream 3))
                    (scale-stream 5))))
