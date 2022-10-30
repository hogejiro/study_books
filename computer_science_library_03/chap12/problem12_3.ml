(* eki_t 型のリストと起点(漢字)を受け取ったら起点のみ初期化された eki_t 型のリストを返す *)
(* shokika: eki_t list -> string -> eki_t list *)
#use "problem12_1.ml"

let rec shokika elst kiten = match elst with
    [] -> [{namae = kiten; saitan_kyori = 0.; temae_list = [kiten]}]
  | {namae = k; saitan_kyori = s; temae_list = t} as first::rest ->
    if kiten = k
      then {namae = kiten; saitan_kyori = 0.; temae_list = [kiten]}::rest
      else first::shokika elst kiten

let test1 = shokika [] "omotesando" = [{namae = "omotesando"; saitan_kyori = 0.; temae_list = ["omotesando"]}]
let test2 = shokika [] "nogizaka" = [{namae = "nogizaka"; saitan_kyori = 0.; temae_list = ["nogizaka"]}]
let test3 = shokika [] "akasaka" = [{namae = "akasaka"; saitan_kyori = 0.; temae_list = ["akasaka"]}]
