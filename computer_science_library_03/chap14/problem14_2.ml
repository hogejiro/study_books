(* 学生データのリストを受け取ったら成績が A の人が何人いるかを返す *)
(* count_A: gakusei_t list -> int *)

type gakusei_t = {
  namae : string;
  tensuu : int;
  seiseki: string;
}
let gakusei1 = {namae = "yoshida"; tensuu = 80; seiseki = "A"}
let gakusei2 = {namae = "asai"; tensuu = 70; seiseki = "B"}
let gakusei3 = {namae = "kaneko"; tensuu = 85; seiseki = "A"}

let count_A glst =
  let is_A g = match g with
    {namae = n; tensuu = t; seiseki = s} -> s = "A"
  in List.length (List.filter is_A glst)

let test1 = count_A [] = 0
let test2 = count_A [gakusei1] = 1
let test3 = count_A [gakusei1;gakusei2] = 1
let test4 = count_A [gakusei1;gakusei2;gakusei3] = 2
