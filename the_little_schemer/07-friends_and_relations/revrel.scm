(add-load-path ".." :relative)
(load "bootstrap.scm")
(select-module relations)
(print (revrel '((8 a) (pumpkin pie) (got sick))))
; ((a 8) (pie pumpkin) (sick got))
