(add-load-path ".." :relative)
(load "bootstrap.scm")
(select-module differences)
(set! x (quote skins))
(print (gourmet 'onion))
; (onion skins)
