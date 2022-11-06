(* gakusei_t 型のリストを受け取ったら全員の得点の合計を返す *)
(* gakusei_sum: gakusei_t list -> int *)
type gakusei_t = {
  namae : string;
  tensuu : int;
  seiseki: string;
}
let gakusei1 = {namae = "yoshida"; tensuu = 80; seiseki = "A"}
let gakusei2 = {namae = "asai"; tensuu = 70; seiseki = "B"}
let gakusei3 = {namae = "kaneko"; tensuu = 85; seiseki = "A"}

let gakusei_sum glst = let tokuten g sum = match g with {namae = n; tensuu = t; seiseki = s} -> t + sum in
  List.fold_right tokuten glst 0

let test1 = gakusei_sum [] = 0
let test2 = gakusei_sum [gakusei1] = 80
let test3 = gakusei_sum [gakusei1;gakusei2] = 150
let test4 = gakusei_sum [gakusei1;gakusei2;gakusei3] = 235
