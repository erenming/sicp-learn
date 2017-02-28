(load "package.scm")

(define (install-sum-package)
    ;internal procedures
    (define (make-sum a1 a2) (cons a1 a2))
    (define (deriv-sum s)
        (make-sum (deriv (addend s)) (deriv (augend s))))

    ;;interface to the rest of the system
    (define (tag x) (attach-tag '+ x))
    (put 'deriv '(+) deriv-sum)
    (put 'make-sum '+
        (lambda (x y) (tag (make-sum x y))))
    'done
)
(define (make-sum x y)
    ((get 'deriv '(+)) (x y)))

(define (install-product-package)
    (define (make-product m1 m2) (cons m1 m2))
    (define (deriv-product p)
        (make-sum
            (make-product (multiplier exp)
                    (deriv (multiplicand exp) var))
            (make-product (deriv (multiplier exp) var)
                    (multiplicand exp))
        ))
    ; interface
    (define (tag x) (attach-tag '* x))
    (put 'deriv '(*) deriv-product)
    (put 'make-product '*
        (lambda (x y) (tag (make-product x y))))
    'done
)
(define (make-product x y)
    ((get 'make-product '*) x y))

(define (deriv x) (apply-generic 'deriv x))

(define (install-exponent-package)
    (define (exponentation-deriv expr var)
        (make-product (exponent expr)
                (make-product
                    (make-exponentation (base expr)
                                        (make-sum (exponent expr) -1))
                    (deriv (base expr) var))))
    (define (exponent expr) (cadr expr))
    (define (base expr) (car expr))
    (define (make-exponentiation base exponent)
        (cond
            ((=number? base 1) 1)
            ((=number? exponent 0) 1)
            ((=number? exponent 1) base)
            (else (list '** base exponent))
        )
    )
    ;interface
    (put 'deriv '** exponentiation-deriv)
    'done
)
