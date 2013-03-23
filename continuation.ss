;;Tan-Yu Liu
;;langlangago

(define con #f)
(define mult
  (lambda (lst)
    (call/cc
     (lambda (break)
       (cond ((null? lst) 1)
             ((= (car lst) 0) (begin
                                (set! con break)
                                (break 0)))
             (else (* (car lst) (mult (cdr lst)))))))))

(define (kmult lst k)
  (kmult-helper lst k k))

(define kmult-helper
  (lambda (lst kr kb)
    (cond ((null? lst) (kr 1))
          ((= (car lst) 0) (kb 0))
          (else
           (kmult-helper (cdr lst) (lambda (v) (kr (* v (car lst)))) kb)))))

;; Test
(define lst1 '(1 2 3 4 0 5 6 7))
(define lst2 '(1 2 3 4 5 6 7 8))
(mult lst1)
(mult lst2)
(kmult lst1 display)
(newline)
(kmult lst2 display)
