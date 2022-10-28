(* ローマ字の駅名を二つ受け取ったら駅間を調べ、直接のつながりがある場合は形式に従い距離を返す。つながってない場合は定型句を返す *)
(* kyori_wo_hyoji: string -> string -> string *)
#use "problem10_10.ml"
#use "problem10_11.ml"

let kyori_wo_hyoji e1 e2 = match (romaji_to_kanji e1 global_ekimei_list, romaji_to_kanji e2 global_ekimei_list) with
    ("", _) -> e1 ^ "という駅は存在しません"
  | (_, "") -> e2 ^ "という駅は存在しません"
  | (ek1, ek2) -> let kyori = (get_ekikan_kyori ek1 ek2 global_ekikan_list) in
      if kyori == infinity
        then ek1 ^ "駅と" ^ ek2 ^ "駅はつながっていません"
        else ek1 ^ "駅から" ^ ek2 ^ "駅までは" ^ (string_of_float kyori) ^ "kmです"

let test1 = kyori_wo_hyoji "myogadani" "shinotsuka" = "茗荷谷駅から新大塚駅までは1.2kmです"
let test2 = kyori_wo_hyoji "shinjuku" "nishi-shinjuku" = "新宿駅から西新宿駅までは0.8kmです"
let test3 = kyori_wo_hyoji "ikebukuro" "kanametyou" = "池袋駅から要町駅までは1.2kmです"
let test4 = kyori_wo_hyoji "ikebukuro" "myogadani" = "池袋駅と茗荷谷駅はつながっていません"
let test5 = kyori_wo_hyoji "gense" "tengoku" = "genseという駅は存在しません"
let test5 = kyori_wo_hyoji "ikebukuro" "tengoku" = "tengokuという駅は存在しません"
