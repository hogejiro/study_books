(add-load-path ".." :relative)
(load "bootstrap.scm")
(select-module relations)
(print (except '(stewed tomatoes and macaroni casserole) '(macaroni and cheese)))
; (stewed tomatoes casserole macaroni and cheese)
