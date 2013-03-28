;;Tan-Yu Liu
;;2013.3.28

(define curry
  (lambda (f . args)
    (lambda x
      (apply f (append args x)))))

;;test
(define plus_1 (curry + 1))
(plus_1 12)
