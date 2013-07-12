#lang racket

#|
(define fact
  (lambda (n)
    (if (= 0 n)
        1
        (* n (fact (- n 1))))))

(fact 5)
|#

;;1
(
 (
  (lambda (fact)
    (lambda (n)
      (if (= 0 n)
          1
          (* n ((fact fact) (- n 1))))))
  (lambda (fact)
    (lambda (n)
      (if (= 0 n)
          1
          (* n ((fact fact) (- n 1))))))) 
 5)
;;2
(
 (
  (lambda (f)
    (f f))
  (lambda (fact)
    (lambda (n)
      (if (= 0 n)
          1
          (* n ((fact fact) (- n 1))))))) 
 5)
;;3
(
 (
  (lambda (f)
    (f f))
  (lambda (fact)
    (lambda (n)
      (if (= 0 n)
          1
          (* n (((lambda (arg) (arg arg))fact) (- n 1))))))
  ) 
 5)
;;4
(
 (
  (lambda (f)
    (f f))
  (lambda (fact)
    ((lambda (double-arg)
       (lambda (n)
         (if (= 0 n)
             1
             (* n (double-arg (- n 1))))))
     (lambda (v) ((fact fact) v))))) ;;double-arg 不能出现在 fact之外，因为lexical scop。出现在外面会发生没有定义的问题！
 5)
;;5
((
  (lambda (Y)
    ((lambda (f)
       (f f))
     (lambda (fact)
       (Y
        (lambda (v) ((fact fact) v))))))
  (lambda (double-arg)
    (lambda (n)
      (if (= 0 n)
          1
          (* n (double-arg (- n 1)))))))
 5)