; recursion
;(define (f n)
;  (if (< n 3)
;    n
;    (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))) ) ))




; iteration
(define (f n)
  (f-iter 2 1 0 0 n))

(define (f-iter c b a i n)
  (if (= i (- n 2))
    c
    (f-iter
      (+ c (* 2 b) (* 3 a))
      c
      b
      (+ i 1)
      n)))
