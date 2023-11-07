(* person_t 型のリストを受け取ったら指定された血液型の人の数を返す *)
(* count_ketsueki: person_t list -> string -> int *)
type person_t = {
  namae : string ;
  shincho : float ;
  taiju : float ;
  tanjoubi : int * int ;
  ketsuekigata : string ;
}

let p1 = { namae = "fuga"; shincho = 170.; taiju = 50.; tanjoubi = (1, 1); ketsuekigata = "A" }
let p2 = { namae = "hoge"; shincho = 148.; taiju = 45.; tanjoubi = (6, 6); ketsuekigata = "O" }
let p3 = { namae = "foo"; shincho = 190.; taiju = 80.; tanjoubi = (12, 12); ketsuekigata = "B" }
let p4 = { namae = "piyo"; shincho = 190.; taiju = 80.; tanjoubi = (12, 12); ketsuekigata = "AB" }
let p5 = { namae = "aaaa"; shincho = 190.; taiju = 80.; tanjoubi = (12, 12); ketsuekigata = "A" }
let p6 = { namae = "bbbb"; shincho = 190.; taiju = 80.; tanjoubi = (12, 12); ketsuekigata = "B" }
let p7 = { namae = "ooo"; shincho = 190.; taiju = 80.; tanjoubi = (12, 12); ketsuekigata = "O" }
let p8 = { namae = "oooo"; shincho = 190.; taiju = 80.; tanjoubi = (12, 12); ketsuekigata = "O" }

let plst1 = []
let plst2 = [p1]
let plst3 = [p1;p2;p3;p4]
let plst4 = [p1;p2;p3;p4;p5;p6;p7;p8]

let rec count_ketsueki plst ketsueki = match plst with
    [] -> 0
  | {namae = n; shincho = s; taiju = ta; tanjoubi = tb; ketsuekigata = k}::rest ->
    if k = ketsueki
      then 1 + count_ketsueki rest ketsueki
      else count_ketsueki rest ketsueki

let count_A plst = count_ketsueki plst "A"
let count_B plst = count_ketsueki plst "B"
let count_O plst = count_ketsueki plst "O"
let count_AB plst = count_ketsueki plst "AB"

let test1 = count_A plst1 = 0
let test2 = count_A plst2 = 1
let test3 = count_A plst3 = 1
let test4 = count_A plst4 = 2
let test5 = count_B plst4 = 2
let test6 = count_O plst4 = 3
let test7 = count_AB plst4 = 1
