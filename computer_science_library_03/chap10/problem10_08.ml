(* person_t 型のリストを受け取ったら 4 つの血液型のうち最も人間の多かった血液型を返す *)
(* saita_ketsueki: person_t list -> string *)
#use "problem10_07.ml"

let p1 = { namae = "fuga"; shincho = 170.; taiju = 50.; tanjoubi = (1, 1); ketsuekigata = "A" }
let p2 = { namae = "hoge"; shincho = 148.; taiju = 45.; tanjoubi = (6, 6); ketsuekigata = "A" }
let p3 = { namae = "foo"; shincho = 190.; taiju = 80.; tanjoubi = (12, 12); ketsuekigata = "B" }
let p4 = { namae = "piyo"; shincho = 160.; taiju = 60.; tanjoubi = (8, 8); ketsuekigata = "AB" }
let p5 = { namae = "hige"; shincho = 160.; taiju = 60.; tanjoubi = (8, 8); ketsuekigata = "B" }
let p6 = { namae = "hage"; shincho = 160.; taiju = 60.; tanjoubi = (8, 8); ketsuekigata = "B" }

let plst1 = [p1]
let plst2 = [p2; p1]
let plst3 = [p3; p2; p1]
let plst4 = [p2; p3; p4; p1]
let plst5 = [p2; p3; p4; p1; p5; p6]

let rec maximum lst = match lst with
    [] -> min_int
  | first::rest ->
    let rest_max = maximum rest in
      if first > rest_max then first
                          else rest_max

let saita_ketsueki plst = match (ketsueki_shukei plst) with
    (a, b, ab, o) ->
      let max_ = maximum [a; b; ab; o] in
             if max_ = a then "A"
        else if max_ = b then "B"
        else if max_ = ab then "AB"
        else "O"

let test1 = saita_ketsueki plst1 = "A"
let test2 = saita_ketsueki plst2 = "A"
let test3 = saita_ketsueki plst3 = "A"
let test4 = saita_ketsueki plst4 = "A"
let test5 = saita_ketsueki plst5 = "B"
