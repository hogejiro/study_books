(add-load-path ".." :relative)
(load "bootstrap.scm")
(select-module conses)
(print (subst 'topping 'fudge '(ice cream with fudge for dessert)))
; (ice cream with topping for dessert)