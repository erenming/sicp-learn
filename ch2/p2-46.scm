(define (make-vect x y)
    (cons x y)
)

(define (xcor-vect) car)

(define (ycor-vect) cdr)

(define (add-vect v1 v2)
    (make (+ (xcor-vect v1) (xcor-vect v2)) (+ (ycor-vect v1) (ycor-vect v2)))
)

(define (sub-vect v1 v2)
    (make (- (xcor-vect v1) (xcor-vect v2)) (- (ycor-vect v1) (ycor-vect v2)))
)

(define (scale-vect s v)
    (make (* s (xcor-vect v)) (* s (ycor-vect v)))
)
