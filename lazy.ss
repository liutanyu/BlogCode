;;Tan-Yu Liu
;;2013.3.23
;;note: the lazy functions have problem when deal with '()
(define countdown
  (lambda (n)
    (if (>= n 0)
        (cons n (lambda () (countdown (- n 1))))
        '())))

(define lazy-cdr
  (lambda (lst)
    ((cdr lst))))

(define lazy-car
  (lambda (lst)
    (car lst)))

(define lazy-cons
  (lambda (a lst)
    (cons a  (lambda () (lazy-cons (car lst) (cdr lst))))))


;;test code
(define count (countdown 9))
(display count) (newline)

(display (lazy-cdr count)) (newline)
(display (lazy-cdr (lazy-cdr count))) (newline)

(define lst (lazy-cons 'a '(b c d e f g)))
(display lst) (newline)
(display (lazy-cdr (lazy-cdr lst)))