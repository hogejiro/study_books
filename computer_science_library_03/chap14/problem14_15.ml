(* 1 から受け取った自然数 n までの合計を求める *)
(* one_to_n: int -> int *)
let rec enumerate n = if n = 0 then [] else n :: enumerate (n - 1)

let one_to_n n = List.fold_right (+) (enumerate n) 0

let test1 = one_to_n 0 = 0
let test2 = one_to_n 1 = 1
let test3 = one_to_n 5 = 15
let test4 = one_to_n 10 = 55
