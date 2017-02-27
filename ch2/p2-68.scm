(load "p2-67.scm")

(define (encode message tree)
    (if (null? message)
        '()
        (append (encode-symbol (car message) tree)
                (encode (cdr message) tree))
    )
)

(define (encode-symbol smb tree)
  (define (branch-correct? branch)
    (if (leaf? branch)
        (equal? smb (symbol-leaf branch))
        (element-of-set? smb (symbols branch))))

  (let ((lb (left-branch tree))
        (rb (right-branch tree)))
    (cond ((branch-correct? lb)
           (if (leaf? lb) '(0) (cons 0 (encode-symbol smb lb))))
          ((branch-correct? rb)
           (if (leaf? rb) '(1) (cons 1 (encode-symbol smb rb))))
          (else (error "bad symbol -- ENCODE-SYMBOL" bit)))))


(define sample-symbol '(A D A B B C A))
