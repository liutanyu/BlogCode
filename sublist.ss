;;Tan-Yu Liu
;;2013.3.25
;;Define a function which, when given a list, returns the list of all its sublists

(define sublist
  (lambda (lst)
    (cond ((null? lst) '(()) )
          (else (append (conslist (car lst) (sublist (cdr lst)))
                        (sublist (cdr lst)))))))

(define conslist
  (lambda (a lst)
    (if (null? lst)
        '()
        (append (list (cons a (car lst)))
                (conslist a (cdr lst))))))

;;test
(define lst '(1 2 3 4))
(sublist lst)