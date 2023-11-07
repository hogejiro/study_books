(* person_t 型のリストを受け取ったらそれを名前の順に整列したリストを返す *)
(* 8.3 *)
type person_t = {
  namae : string ;
  shincho : float ;
  taiju : float ;
  tanjoubi : int * int ;
  ketsuekigata : string ;
}

let fuga = { namae = "fuga"; shincho = 170.; taiju = 50.; tanjoubi = (1, 1); ketsuekigata = "A" }
let hoge = { namae = "hoge"; shincho = 148.; taiju = 45.; tanjoubi = (6, 6); ketsuekigata = "O" }
let foo = { namae = "foo"; shincho = 190.; taiju = 80.; tanjoubi = (12, 12); ketsuekigata = "B" }

let plst1 = [fuga]
let plst2 = [foo; fuga]
let plst3 = [foo; fuga; hoge]

let rec person_insert plst p = match plst with
    [] -> [p]
  | {namae = n1; shincho = s1; taiju = t1; tanjoubi = tj1; ketsuekigata = k1} as first::rest ->
      match p with
        {namae = n2; shincho = s2; taiju = t2; tanjoubi = tj2; ketsuekigata = k2} ->
          if n2 > n1 then first::person_insert rest p
                     else p::first::rest

let ins_test1 = person_insert [] fuga = plst1
let ins_test2 = person_insert plst1 foo = plst2
let ins_test3 = person_insert plst2 hoge = plst3

let rec person_sort plst = match plst with
    [] -> []
  | {namae = n1; shincho = s1; taiju = t1; tanjoubi = tj1; ketsuekigata = k1} as first::rest ->
    person_insert (person_sort rest) first

let test1 = person_sort [] = []
let test2 = person_sort plst1 = plst1
let test3 = person_sort [fuga; foo] = plst2
let test4 = person_sort [fuga; foo; hoge] = plst3
let test5 = person_sort [hoge; foo; fuga] = plst3
