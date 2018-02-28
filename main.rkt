#lang racket
(require web-server/servlet
         web-server/servlet-env)
(require "web-server.rkt")

(serve/servlet my-app
               #:port 8080
               #:servlet-path "/hello"
               #:launch-browser? false)
