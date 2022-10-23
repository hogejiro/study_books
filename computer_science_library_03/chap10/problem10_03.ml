(* gakusei_t 型のリストを受け取ったらそれを tensuu フィールドの順に整列したリストを返す *)
(* gakusei_sort: gakusei_t list -> gakusei_t list *)
type gakusei_t = {
  namae : string;
  tensuu : int;
  seiseki: string;
}
let gakusei1 = {namae = "yoshida"; tensuu = 80; seiseki = "B"}
let gakusei2 = {namae = "asai"; tensuu = 70; seiseki = "B"}
let gakusei3 = {namae = "kaneko"; tensuu = 85; seiseki = "A"}

let lst1 = []
let lst2 = [gakusei2]
let lst3 = [gakusei2; gakusei3]
let lst4 = [gakusei1; gakusei2; gakusei3]

let rec gakusei_insert glst g = match glst with
    [] -> [g]
  | {namae = n1; tensuu = t1; seiseki = s1} as first::rest -> match g with
      {namae = n2; tensuu = t2; seiseki = s2} -> if t2 > t1 then first :: gakusei_insert rest g
                                                            else g :: first :: rest

  let ins_test1 = gakusei_insert lst1 gakusei2 = lst2
  let ins_test2 = gakusei_insert lst2 gakusei3 = lst3
  let ins_test3 = gakusei_insert lst3 gakusei1 = [gakusei2; gakusei1; gakusei3]

let rec gakusei_sort glst = match glst with
    [] -> []
  | {namae = n; tensuu = t; seiseki = s} as first::rest -> gakusei_insert (gakusei_sort rest) first

let test1 = gakusei_sort lst1 = []
let test2 = gakusei_sort lst2 = lst2
let test3 = gakusei_sort lst3 = lst3
let test4 = gakusei_sort lst4 = [gakusei2; gakusei1; gakusei3]
