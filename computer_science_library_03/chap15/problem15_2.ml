(* ユークリッドの互除法に基づいて、二つの自然数を受け取ったら最大公約数を返す *)
(* 再帰のたびに m は n が代入され n は小さくなるので明らかに停止する *)
(* gcd: int -> int -> int *)
let rec gcd m n = if n = 0
  then m
  else gcd n (m mod n)

let test1 = gcd 1 1 = 1
let test2 = gcd 5 1 = 1
let test3 = gcd 5 2 = 1
let test4 = gcd 6 3 = 3
let test5 = gcd 12 8 = 4
let test6 = gcd 72 32 = 8
