;;Tan-Yu Liu
;;2012.3.24
(define fac
  (lambda (n)
    (cond ((= 0 n) 1)
          (else (* n (fac (- n 1)))))))

(define fac&
  (lambda (n k)
    (cond ((= 0 n) (k 1))
          (else (fac& (- n 1) (lambda (v) (k (* v n))))))))

(define fib
  (lambda (n)
    (cond ((= 0 n) 1)
          ((= 1 n) 1)
          (else (+ (fib (- n 1)) (fib (- n 2)))))))

(define fib&
  (lambda (n k)
    (cond ((= 0 n) (k 1))
          ((= 1 n) (k 1))
          (else (fib& (- n 1) (lambda (v1) (fib& (- n 2) (lambda (v2) (k (+ v1 v2))))))))))