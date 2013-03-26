(define cc
  (lambda(amount coins)
    (cond
      ((< amount 0) 0)
      ((= amount 0) 1)
      ((null? coins) 0)
      (else (+ (cc amount (cdr coins))
               (cc (- amount (car coins)) coins))))))
(define coins (list 1 5 10 25 50))
(cc 100 coins)


(define (comb coins total)
  (let ((ncombs 0))
    (define (comb-iter coins total solution idx q)
      (let* ((c (list-ref coins idx)) (qc (if (= -1 q) (quotient total c) q)) (r (- total (* qc c))))
        (begin
          (if (zero? r) 
              (begin 
                (set! ncombs (+ 1 ncombs))
                (write (append solution (list qc))) ; print solution if target reached
                (newline))
              ; if target not reached, then move on to next coin, duly adjusting the total
              (if (< idx (- (length coins) 1)) ; making sure index into list is valid 
                  ; call comb for the next coin
                  (comb-iter coins (- total (* qc c)) (append solution (list qc)) (+ 1 idx) -1)))
          ; count down the coin quantity to 0 for alternate possibilities
          (if (> qc 0)  
              ; decrement quantity for current coin and recalculate possibilities
              (comb-iter coins total solution idx (- qc 1))))))
    (comb-iter coins total '() 0 -1)
    (newline)
    (display (string-append (number->string ncombs) " combinations."))))
 
(comb '(1 5 10 25 50) 100)