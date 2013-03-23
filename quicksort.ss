#lang scheme

;; test in racket 5.3
;; Tan-Yu Liu 2013.3.1
;; sort list
;; quicksort list -> list

(define quicksort
  (lambda (lst)
    (cond ((null? lst) '())
          (else (let ((les (less-then (car lst) (cdr lst)))
                      (gre (great-then (car lst) (cdr lst))))
                  (append (quicksort les)
                        (cons
                         (car lst)
                         (quicksort gre))))))))
;; helper function
(define less-then
  (lambda (x xs)
    (cond ((null? xs) '())
          ((< x (car xs)) (less-then x (cdr xs)))
          (else (cons (car xs)
                      (less-then x (cdr xs)))))))

(define great-then
  (lambda (x xs)
    (cond ((null? xs) '())
          ((>= x (car xs)) (great-then x (cdr xs)))
          (else (cons (car xs)
                      (great-then x (cdr xs)))))))

;; Test
(define lst '(2 3 53 1 4 7 8 0 7 6 55 5 4 2 3 121 32 80 -7 -97))
(quicksort lst)
                      
           