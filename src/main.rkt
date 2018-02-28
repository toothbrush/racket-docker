#lang racket/base
(require web-server/servlet
         web-server/servlet-env)
(require "web-server.rkt")

(serve/servlet my-app
               #:port 8080
               #:listen-ip #f
               #:servlet-path "/hello"
               #:launch-browser? #f)
