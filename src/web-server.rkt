#lang racket
(require web-server/http)

(provide my-app body-message)

(define (body-message req)
  "Hello there, welcome to my website!")

(define (my-app req)
  (response/xexpr
   `(html (head (title "Hello world!"))
          (body (p ,(body-message req))))))
