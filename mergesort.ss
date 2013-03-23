;; mergesort:list -> list
;; Tan-Yu Liu 2013.3.2
;; Test in racket5.3

(define mergesort
  (lambda (lst)
    (cond ((null? lst) '())
          ((null? (cdr lst)) lst)
          ((null? (cddr lst))
           (merge (split 'left lst) (split 'right lst)))
          (else
           (merge (mergesort (split 'left lst))
                  (mergesort (split 'right lst)))))))

(define merge
  (lambda (lstl lstr)
    (cond ((null? lstl) lstr)
          ((null? lstr) lstl)
          ((< (car lstl) (car lstr))
           (cons (car lstl)
                   (merge (cdr lstl) lstr)))
          (else 
           (cons (car lstr)
                   (merge lstl (cdr lstr)))))))

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
(define lst '(2 3 1 4 5 0 -4 9 12 34 8 7 -13 8 6 7))
(mergesort lst)