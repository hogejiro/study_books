(add-load-path ".." :relative)
(load "bootstrap.scm")
(select-module lambda)
(print ((rember-f eq?) 'jelly '(jelly beans are good)))
; (beans are good)
(define rember-eq? (rember-f eq?))
(print (rember-eq? 'jelly '(jelly beans are good)))
; (beans are good)