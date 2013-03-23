#lang scheme

;; mergesort:list -> list
;; Tan-Yu Liu 2013.3.2
;; Test in racket5.3

#|(define mergesort
  (lambda (lst)
    (let ((lstl (split 'left lst))
          (lstr (split 'right lst))
          (sortlst '()))
      (merge lstl lstr))))|#

(define merge
  (lambda (lstl lstr)
    (let ((mergelist '()))
      (while (not (and (null? lstl) (null? lstr)))
             (cond ((null? lstl)
                    (begin 
                      (set! mergelist (cons (car lstr) mergelist))
                      (set! lstr (cdr lstr))))
                   ((null? lstr)
                    (begin
                      (set! mergelist (cons (car lstl) mergelist))
                      (set! lstl (cdr lstl))))
                   ((>= (car lstl) (car lstr))
                    (begin 
                      (set! mergelist (cons (car lstr) mergelist))
                      (set! lstr (cdr lstr))))
                   (else
                    (begin
                      (set! mergelist (cons (car lstl) mergelist))
                      (set! lstl (cdr lstl))))))
      (merge lstl lstr))))
	     
(define-syntax while
  (syntax-rules ()
    ((_ pred b1 ...)
     (call/cc 
      (lambda (break)
        (let loop () (if pred
                         (begin
                           b1 ...)
                         (break))
          (loop)))))))	 

(define split
  (lambda (site lst)
    (cond ((eqv? site 'left)
           (let ((len (lengh lst)))
             (if (odd? len)
                 (let ((lenr (/ (+ len 1) 2)))
                   (cutlst lst lenr))
                 (let ((lenr (/ len 2)))
                   (cutlst lst lenr)))))
          ((eqv? site 'right)
           (let ((len (lengh lst)))
             (if (odd? len)
                 (let ((lenl (/ (+ len 1) 2)))
                   (droplst lst lenl))
                 (let ((lenl (/ len 2)))
                   (droplst lst lenl))))))))

(define cutlst
  (lambda (lst len)
    (if (= 0 len)
        '()
        (cons (car lst) (cutlst (cdr lst) (- len 1))))))

(define droplst
  (lambda (lst len)
    (if (= 0 len)
        lst
        (droplst (cdr lst) (- len 1)))))

(define lengh
  (lambda (lst)
    (if (null? lst)
        0
        (+ 1 (lengh (cdr lst))))))

;; Test
(define lst '(1 3 5 2 11 32 8 9 0 4 -3 -2 -1))
(define l (split 'left lst))
(define r (split 'right lst))
(while (not (null? lst))
         (display lst)
         (newline)
         (set! lst (cdr lst)))
;(mergesort lst)
;(merge l r)