;;Tan-Yu Liu
;;2013.3.26
;;Y combinator

;cannot change constant constant: length
(define langth
  (lambda (lst)
    (cond ((null? lst) 0)
          (else (+ 1 (langth (cdr lst)))))))
;;test
(langth '(1 2 3 4))
(newline)

;;1

(((lambda (langth)
    (lambda (lst)
      (cond ((null? lst) 0)
            (else (+ 1 ((langth langth) (cdr lst)))))))
  (lambda (langth)
    (lambda (lst)
      (cond ((null? lst) 0)
            (else (+ 1 ((langth langth) (cdr lst)))))))) '(1 2 3 4))

;;2
(((lambda (f)
    (f f))
  (lambda (langth)
    (lambda (lst)
      (cond ((null? lst) 0)
            (else (+ 1 ((langth langth) (cdr lst)))))))) '(1 2 3 4))

;;3
(((lambda (f)
    (f f))
  (lambda (langth)
    ((lambda (f0)
       (lambda (lst)
         (cond ((null? lst) 0)
               (else (+ 1 (f0 (cdr lst)))))))
     (lambda (v) ((langth langth) v))))) '(1 2 3 4))

;;4
(((lambda (f)
    ((lambda (u)
      (u u))
    (lambda (x)
      (f
       (lambda (v) ((x x) v))))))
  (lambda (langth)
    (lambda (lst)
      (cond ((null? lst) 0)
            (else (+ 1 (langth (cdr lst)))))))) '(1 2 3 4))