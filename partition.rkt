;;Tan-Yu Liu
;;2013.3.26

(define partition
  (lambda (amount lst)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (null? lst)) 0)
          (else (+ (partition amount (cdr lst))
                   (partition (- amount (car lst)) lst))))))

;;test
(partition 4 '(1 2 3))