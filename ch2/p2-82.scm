(define (apply-generic op . args)
    ;;if all types can coerced into target-type
    (define (can-coerced-into? types target-type)
        (andmap
            (lambda (type)
                    (or (equal? type target-type)
                        (get-coercion type target-type)))
            types))

    ;; find one type that all other types can coerced into
    (define (find-coerced-type types)
        (ormap
            (lambda (target-type)
                    (if (can-coerced-into? type target-type)
                        target-type
                        #f))
        types))

    ;;coerced args into target-type
    (define (coerced-all target-type)
        (map
            (lambda (arg)
                    (let ((arg-type (type-tag arg)))
                        (if (equal? arg-type target-type)
                            arg
                            ((get-coercion arg-type target-type) arg)
                        )))
            args))

    (let ((type-tags (map type-tag args)))
        (let ((pro (get op type-tags)))
            (if proc
                (apply proc (map contents args))
                (let ((target-type (find-coerced-type type-tags)))
                    (if target-type
                        (apply apply-generic
                            (append (list op) (coerced-all target-type))))
                )
                (error
                    "No method for these types -- APPLY-GENERIC"
                    (list op type-tags))))))
