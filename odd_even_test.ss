;;Tan-Yu Liu
;;2013.3.25

(define odd-even?
  (lambda (n)
    (letrec ((e? (lambda (n)
                   (cond ((= 1 n) 'odd)
                         ((= 2 n) 'even)
                         (else (o? (- n 1))))))
             (o? (lambda (n)
                   (cond ((= 1 n) 'odd)
                         ;((= 2 n) 'even)   You would not get right answer if you add this line!
                         (else (e? (- n 1)))))))
      (e? n))))

;;test
(odd-even? 11)
(odd-even? 133)
(odd-even? 1234)