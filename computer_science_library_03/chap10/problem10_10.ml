(* ローマ字の駅名と駅名リストを受け取ったらその駅の漢字表記を文字列で返す *)
(* romaji_to_kanji: string -> ekimei_t list -> string *)
#use "../chap09/problem9_09.ml"

let rec romaji_to_kanji romaji emlst = match emlst with
    [] -> ""
  | {kanji = k; kana = kn; romaji = r; shozoku = s}::rest ->
    if romaji = r then k
                  else romaji_to_kanji romaji rest

let test1 = romaji_to_kanji "myogadani" global_ekimei_list = "茗荷谷"
let test2 = romaji_to_kanji "shinjuku" global_ekimei_list = "新宿"
let test3 = romaji_to_kanji "ikebukuro" global_ekimei_list = "池袋"
let test4 = romaji_to_kanji "shimabukuro" global_ekimei_list = ""
