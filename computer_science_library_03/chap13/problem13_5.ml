(* twice: ('a -> 'a) -> ('a -> 'a) *)
let twice f = let g x = f (f x) in g

(* twice_twice: ('a -> 'a) -> ('a -> 'a) *)
let twice_twice f = let g = twice (twice f) in g
