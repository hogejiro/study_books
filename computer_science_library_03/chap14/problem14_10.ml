(* 14.1 rewrite *)
let even lst = List.filter (fun n -> n mod 2 = 0) lst

let test1 = even [] = []
let test2 = even [0;1;3] = [0]
let test3 = even [1;1;3] = []
let test4 = even [0;1;3;5;6;7;8;9] = [0;6;8]

(* 14.2 rewrite *)
type gakusei_t = {
  namae : string;
  tensuu : int;
  seiseki: string;
}

let gakusei1 = {namae = "yoshida"; tensuu = 80; seiseki = "A"}
let gakusei2 = {namae = "asai"; tensuu = 70; seiseki = "B"}
let gakusei3 = {namae = "kaneko"; tensuu = 85; seiseki = "A"}

let count_A glst =
  List.length (List.filter (fun g -> match g with {namae = n; tensuu = t; seiseki = s} -> s = "A") glst) 

let count_test1 = count_A [] = 0
let count_test2 = count_A [gakusei1] = 1
let count_test3 = count_A [gakusei1;gakusei2] = 1
let count_test4 = count_A [gakusei1;gakusei2;gakusei3] = 2

(* 14.3 rewrite *)
let rec concat lst = List.fold_right (fun a b -> a ^ b) lst ""

let concat_test1 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"
let concat_test2 = concat [] = ""
let concat_test3 = concat ["無"] = "無"
let concat_test4 = concat [""; "塵地螺鈿飾"; ""; "剣"] = "塵地螺鈿飾剣"

(* 14.4 rewrite *)
let gakusei_sum glst = List.fold_right (fun g sum -> match g with {namae = n; tensuu = t; seiseki = s} -> t + sum) glst 0

let gs_test1 = gakusei_sum [] = 0
let gs_test2 = gakusei_sum [gakusei1] = 80
let gs_test3 = gakusei_sum [gakusei1;gakusei2] = 150
let gs_test4 = gakusei_sum [gakusei1;gakusei2;gakusei3] = 235
