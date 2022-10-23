(* 昇順な整数リストと整数を受け取ったら整数を昇順を保ったまま挿入したリストを返す *)
(* insert: int list -> int -> int list *)
let rec insert lst n = match lst with
    [] -> [n]
  | first::rest -> if first < n then first :: insert rest n
                                else n :: first :: rest

let test1 = insert [] 3 = [3]
let test2 = insert [1] 0 = [0; 1]
let test3 = insert [1; 3] 2 = [1; 2; 3]
let test4 = insert [2; 4; 7] 3 = [2; 3; 4; 7]
let test5 = insert [10; 15; 20] 1 = [1; 10; 15; 20]
let test6 = insert [10; 15; 20] 25 = [10; 15; 20; 25]
