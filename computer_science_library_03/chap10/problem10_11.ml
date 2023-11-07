(* 漢字の駅名を二つと駅間リストを受け取ったら駅間リストの中から二駅間の距離を返す *)
(* get_ekikan_kyori: string -> string -> ekikan_t list -> float *)
#use "../chap09/problem9_10.ml"

let rec get_ekikan_kyori ek1 ek2 eklst = match eklst with
    [] -> infinity
  | {kiten = kt; shuten = st; keiyu = ky; kyori = kr; jikan = jk}::rest ->
    if (kt = ek1 && st = ek2) || (kt = ek2 && st =ek1)
      then kr
      else get_ekikan_kyori ek1 ek2 rest

let test1 = get_ekikan_kyori "茗荷谷" "新大塚" global_ekikan_list = 1.2
let test2 = get_ekikan_kyori "新宿" "西新宿" global_ekikan_list = 0.8
let test3 = get_ekikan_kyori "池袋" "要町" global_ekikan_list = 1.2
let test4 = get_ekikan_kyori "現世" "天国" global_ekikan_list = infinity
