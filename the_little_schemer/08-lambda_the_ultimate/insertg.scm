(add-load-path ".." :relative)
(load "bootstrap.scm")
(select-module lambda)
(print (insertL 'fuga 'hoge '(a b hoge c d)))
; (a b fuga hoge c d)
(print (insertR 'fuga 'hoge '(a b hoge c d)))
; (a b hoge fuga c d)
(print (subst 'fuga 'hoge '(a b hoge c d)))
; (a b fuga c d)
(print (rember 'hoge '(a b hoge c d)))
; (a b c d)
