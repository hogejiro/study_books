(* 関数をふたつ受け取ったらふたつの関数を合成した関数を返す *)
(* compose: ('a -> 'b) -> ('b -> 'c) -> ('a -> 'c) *)
let compose f g = let h x = g (f x) in h
