(* eki_t 型のリストと起点(漢字)を受け取ったら起点のみ初期化された eki_t 型のリストを返す *)
(* shokika: eki_t list -> string -> eki_t list *)
#use "problem12_1.ml"

let rec shokika elst kiten = match elst with
    [] -> [{namae = kiten; saitan_kyori = 0.; temae_list = [kiten]}]
  | {namae = k; saitan_kyori = s; temae_list = t} as first::rest ->
    if kiten = k
      then {namae = kiten; saitan_kyori = 0.; temae_list = [kiten]}::rest
      else first::shokika elst kiten

let test1 = shokika [] "表参道" = [{namae = "表参道"; saitan_kyori = 0.; temae_list = ["表参道"]}]
let test2 = shokika [] "乃木坂" = [{namae = "乃木坂"; saitan_kyori = 0.; temae_list = ["乃木坂"]}]
let test3 = shokika [] "赤坂" = [{namae = "赤坂"; saitan_kyori = 0.; temae_list = ["赤坂"]}]
