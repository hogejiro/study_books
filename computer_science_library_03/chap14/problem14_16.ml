(* 受け取ったら自然数の階乗を求める *)
(* fac: int -> int *)
let rec enumerate n = if n = 0 then [] else n :: enumerate (n - 1)

let fac n = List.fold_right ( * ) (enumerate n) 1

let test1 = fac 1 = 1
let test2 = fac 3 = 6
let test3 = fac 5 = 120
let test4 = fac 7 = 5040
