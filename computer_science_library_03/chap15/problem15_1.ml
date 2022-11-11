(* 目的：受け取った lst をクイックソートを使って昇順に整列する *)
(* 15.3 のコードのままだと要素が重複するリストから重複分を除いてしまう。
   take_less か take_greater の不等号に = を追加する必要がある。本コードでは前者に = を追加した *)
(* quick_sort : int list -> int list *)
let rec quick_sort lst =
  (* 目的：lst の中から n より p である要素のみを取り出す *)
  (* take : int -> int list -> (int -> int -> bool) -> int list *)
  let take n lst p = List.filter (fun item -> p item n) lst
  (* 目的：lst の中から n より小さい要素のみを取り出す *)
  (* take_less : int -> int list -> int list *)
  in let take_less n lst = take n lst (<=)
  (* 目的：lst の中から n より大きい要素のみを取り出す *)
  (* take_greater : int -> int list -> int list *)
  in let take_greater n lst = take n lst (>)
  in match lst with
         [] -> []
       | first :: rest -> quick_sort (take_less first rest)
                          @ [first]
                          @ quick_sort (take_greater first rest)

(* テスト *)
let test1 = quick_sort [] = []
let test2 = quick_sort [1] = [1]
let test3 = quick_sort [1; 2] = [1; 2]
let test4 = quick_sort [2; 1] = [1; 2]
let test5 = quick_sort [5; 4; 9; 8; 2; 3] = [2; 3; 4; 5; 8; 9]
(* 下記を追加 *)
let test6 = quick_sort [2; 3; 3; 2] = [2; 2; 3; 3]
