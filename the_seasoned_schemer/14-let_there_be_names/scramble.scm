(add-load-path ".." :relative)
(load "bootstrap.scm")
(select-module names)
(print (scramble '(1 2 3 2 2)))
; (1 1 1 3 2)
