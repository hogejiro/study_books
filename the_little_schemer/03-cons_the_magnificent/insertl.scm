(add-load-path ".." :relative)
(load "bootstrap.scm")
(select-module conses)
(print (insertL 'topping 'fudge '(ice cream with fudge for dessert)))
; (ice cream with topping fudge for dessert)
(print (insertL 'e 'd '(a b c d f g d h)))
; (a b c e d f g d h)