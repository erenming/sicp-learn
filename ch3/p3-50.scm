(load "stream.scm")

(define (stream-map proc . argstreams)
    (if (stream-null? (car argstreams))
        the-empty-stream
        (
            cons-stream
            (apply proc (map stream-car argstreams))
            (cons proc (map stream-cdr argstreams))
        )
    )
)
