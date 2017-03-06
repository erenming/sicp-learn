(define (assoc key records)
    (cond
        ((null? records) false)
        ((equal? key (caar records)) (car records))
        (else (assoc key (cdr records))))
)

; loop up value by key-1 and key-2
(define (lookup keys table)
    (set! keys (list keys))
    (if (list? keys)
        (let ((current-key (car keys))
                (remain-key (cdr keys)))
            (let ((record (assoc current-key (cdr table))))
                (if record
                    (if (null? remain-key) (cdr record) (lookup remain-key record))
                    false)
            )
        )
    )
)

; insert record into table
(define (insert! keys value table)
    (define (join-in-table new-record table)
        (set-cdr! table (cons new-record (cdr table)))
    )
    (set! keys (list keys))
    (if (list? keys)
        (let ((current-key (car keys))
                (remain-key (cdr keys)))
            (let ((record (assoc current-key (cdr table))))
                (cond
                    ; 有记录，无多余 更新
                    ((and record (null? remain-key))
                        (set-cdr! record value) table)
                    ; 有记录，有多余 递归插入
                    ((and record remain-key)
                        (insert! remain-key value record) table)
                    ; 无记录，无多余 创表
                    ((and (not record) (null? remain-key))
                        (let ((new-record (cons current-key value)))
                            (join-in-table new-record table)table
                        ))
                    ; 无记录，有多余 创建多keys表
                    ((and (not record) remain-key)
                        (join-in-table (insert! remain-key value (make-table current-key))
                            table)table
                    )
                )
            )
        )
    )
)

; create a new table
(define (make-table . table-name)
    (if (null? table-name)
        (list '*table*)
        (table-name)
    )
)
