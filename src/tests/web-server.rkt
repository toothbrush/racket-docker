#lang racket

(require "../web-server.rkt")

(module+ test
  (require rackunit)
  (check-equal? (body-message 'nil)
                "Hello there, welcome to my website!"))
