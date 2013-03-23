#lang scheme

;; Define new syntax: while
;; Tan-Yu Liu 2013.3.2
;; Test in racket5.3
;; Note the real while implimetation do not need the "hello contiunation" string.

(define-syntax while
  (syntax-rules ()
    ((_ pred b1 ...)
     (call/cc 
      (lambda (break)
        (let loop () (if pred
                         (begin
                           b1 ...)
                         (break "hello continuation"))
          (loop)))))))

;; Test

(define a 1)

(while (< a 12)
       (display a)
       (set! a (+ 1 a))
       (newline))