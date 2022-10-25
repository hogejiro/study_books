(* person_t 型のリストを受け取ったら各血液型の人間が何人いるかをタプルにして返す *)
(* ketsueki_shukei: person_t list -> int * int * int * int *)
(* 8.3 *)
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
let p4 = { namae = "piyo"; shincho = 160.; taiju = 60.; tanjoubi = (8, 8); ketsuekigata = "AB" }

let plst1 = [p1]
let plst2 = [p2; p1]
let plst3 = [p3; p2; p1]
let plst4 = [p2; p3; p4; p1]

let rec ketsueki_shukei plst = match plst with
    [] -> (0, 0, 0, 0)
  | {namae = n; shincho = s; taiju = ta; tanjoubi = tb; ketsuekigata = k}::rest ->
    let (a, b, ab, o) = ketsueki_shukei rest in
           if k = "A" then (a + 1, b, ab, o)
      else if k = "B" then (a, b + 1, ab, o)
      else if k = "AB" then (a, b, ab + 1, o)
                       else (a, b, ab, o + 1)

let test1 = ketsueki_shukei plst1 = (1, 0, 0, 0)
let test2 = ketsueki_shukei plst2 = (1, 0, 0, 1)
let test3 = ketsueki_shukei plst3 = (1, 1, 0, 1)
let test4 = ketsueki_shukei plst4 = (1, 1, 1, 1)
