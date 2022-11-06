(* 整数のリストを受け取ったら、その中の偶数の要素のみを含むリストを返す *)
(* even: int list -> int list *)
let even lst = let mod2eq0 n = n mod 2 = 0 in List.filter mod2eq0 lst

let test1 = even [] = []
let test2 = even [0;1;3] = [0]
let test3 = even [1;1;3] = []
let test4 = even [0;1;3;5;6;7;8;9] = [0;6;8]
