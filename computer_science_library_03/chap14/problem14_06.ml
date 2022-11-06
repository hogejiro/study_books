(* 学生リストと成績を受け取ったら指定された成績の人数を返す *)
(* count: gakusei_t 1ist -> string -> int *) 
type gakusei_t = {
  namae : string;
  tensuu : int;
  seiseki: string;
}
let gakusei1 = {namae = "yoshida"; tensuu = 80; seiseki = "A"}
let gakusei2 = {namae = "asai"; tensuu = 70; seiseki = "B"}
let gakusei3 = {namae = "kaneko"; tensuu = 85; seiseki = "A"}

let count glst seiseki = let is_seiseki g = match g with {namae = n; tensuu = t; seiseki = s} -> s = seiseki in
  List.length (List.filter is_seiseki glst)

let test1 = count [] "A" = 0
let test2 = count [gakusei1] "A" = 1
let test3 = count [gakusei1] "B" = 0
let test4 = count [gakusei1;gakusei2] "A" = 1
let test5 = count [gakusei1;gakusei2] "B" = 1
let test6 = count [gakusei1;gakusei2;gakusei3] "A" = 2
let test7 = count [gakusei1;gakusei2;gakusei3] "B" = 1
