(add-load-path ".." :relative)
(load "bootstrap.scm")
(select-module lambda)
(print ((multirember-f eq?) 'tuna '(shrimp salad tuna salad and tuna)))
; (shrimp salad salad and)
