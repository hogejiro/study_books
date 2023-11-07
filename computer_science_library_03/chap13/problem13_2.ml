(* person_t 型のリストを受け取ったらリスト内の人の名前のリストを返す *)
(* person_name: person_t list -> string list *)
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

let pname p = match p with
    {namae = n; shincho = s; taiju = ta; tanjoubi = tb; ketsuekigata = k} -> n
let person_name plst = List.map pname plst

let test1 = person_name plst1 = []
let test2 = person_name plst2 = ["fuga"]
let test3 = person_name plst3 = ["fuga"; "hoge"; "foo"; "piyo"]
let test4 = person_name plst4 = ["fuga"; "hoge"; "foo"; "piyo"; "aaaa"; "bbbb"; "ooo"; "oooo"]
