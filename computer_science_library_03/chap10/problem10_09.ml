(* ふたつのリストを受け取ったらそれらの長さが同じかどうかを判定する *)
(* equal_length: a list -> a list -> bool *)
let rec equal_length lst1 lst2 = match (lst1, lst2) with
    ([], []) -> true
  | ([], _) -> false
  | (_, []) -> false
  | (first1::rest1, first2::rest2) -> equal_length rest1 rest2

let test1 = equal_length [] [] = true
let test2 = equal_length ["a"] ["b"] = true
let test3 = equal_length ["a"] [] = false
let test4 = equal_length [] ["b"] = false
let test5 = equal_length [1; 2; 3] [4; 5; 6] = true
let test6 = equal_length ["春"; "夏"; "秋"; "冬"] ["東"; "西"; "南"; "北"] = true
