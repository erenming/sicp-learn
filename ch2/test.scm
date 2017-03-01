(define (type-tag data)
    (if (pair? data)
        (car data)
        (error "Bad tagged data -- TYPE-TAG" data)))
