; local table version
(define (make-table)
    (let ((local-table (list '*table*)))
        ; loop up value by key-1 and key-2
        (define (lookup key-1 key-2)
            (let ((subtable (assoc key-1 (cdr local-table))))
                (if subtable
                    (let ((record (assoc key-2 (cdr subtable))))
                        (if record
                            (cdr record)
                            false)
                    )
                    false)
            )
        )

        ; insert record into table
        (define (insert! key-1 key-2 value)
            (let ((subtable (assoc key-1 (cdr local-table))))
                (if subtable
                    (let ((record (assoc key-2 (cdr subtable))))
                        (if record
                            (set-cdr! record value)
                            (set-cdr! subtable
                                        (cons (cons key-2 value) (cdr subtable)))
                        )
                    )
                    ; create a new subtable with key-1 and key-2
                    (set-cdr! local-table
                        (cons (list key-1 (cons key-2 value)) (cdr local-table)))
                )
            )

        )

        (define (assoc key records)
            (cond
                ((null? records) false)
                ((same-key? key (caar records)) (car records))
                (else (assoc key (cdr records))))
        )

        ;interface of the rest
        (defie (dispatch m)
            (cond
                ((eq? m 'lookup-proc) lookup)
                ((eq? m 'insert-proc) insert!)
                (else (error "Unknown operation -- TABLE" m))
            )
        )
        dispatch
    )
)
