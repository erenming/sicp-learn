(define (exp base n)
    (define (exp-iter i result)
        (if (= i n) result
            (exp-iter (+ i 1) (* result base))
        )
    )
    (exp-iter 0 1)
)

(define (my-cons a b)
    (* (exp 2 a) (exp 3 b))
)

(define (count-divisions div item)
    (define (iter i result)
        (if (= (remainder result div) 0)
            (iter (+ i 1) (/ result div))
            i
        )
    )
    (iter 0 item)
)

(define (my-car c)
    (count-divisions 2 c)
)

(define (my-cdr c)
    (count-divisions 3 c)
)
