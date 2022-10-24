(* gakusei_t 型のリストを受け取ったら最高得点を取った人のレコードを返す *)
(* gakusei_max: gakusei_t list -> gakusei_t *)

type gakusei_t = {
  namae : string;
  tensuu : int;
  seiseki: string;
}

let gakusei1 = {namae = "yoshida"; tensuu = 80; seiseki = "B"}
let gakusei2 = {namae = "asai"; tensuu = 70; seiseki = "B"}
let gakusei3 = {namae = "kaneko"; tensuu = 85; seiseki = "A"}

let glst1 = [gakusei1]
let glst2 = [gakusei2; gakusei1]
let glst3 = [gakusei1; gakusei2; gakusei3]

let rec gakusei_max glst = match glst with
    [] -> {namae = ""; tensuu = min_int; seiseki = ""}
  | {namae = n1; tensuu = t1; seiseki = s1} as gakusei::rest ->
    let gakusei_other = gakusei_max rest in
      match gakusei_other with
        {namae = n2; tensuu = t2; seiseki = s2} -> if t1 > t2 then gakusei
                                                              else gakusei_other

let test1 = gakusei_max glst1 = gakusei1
let test2 = gakusei_max glst2 = gakusei1
let test3 = gakusei_max glst3 = gakusei3
