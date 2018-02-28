#lang racket

(require "../web-server.rkt")

(module+ test
  (require rackunit)
  (check-equal? (body-message #f)
                "Hello there, welcome to my website!"))
