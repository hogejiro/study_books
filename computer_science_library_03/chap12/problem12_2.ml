(* ekimei_t 型のリストを受け取ったらその駅名を使って eki_t 型のリストを作る *)
(* make_eki_list: ekimei_t list -> eki_t list *)
#use "../chap09/problem9_09.ml"
#use "problem12_1.ml"

let rec make_eki_list emlst = match emlst with
    [] -> []
  | {kanji = k; kana = kn; romaji = r; shozoku = s}::rest ->
    {namae = k; saitan_kyori = infinity; temae_list = []}::make_eki_list rest

let omotesando =  {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"}
let nogizaka = {kanji="乃木坂"; kana="のぎざか"; romaji="nogizaka"; shozoku="千代田線"}
let akasaka = {kanji="赤坂"; kana="あかさか"; romaji="akasaka"; shozoku="千代田線"}

let test1 = make_eki_list [] = []
let test2 = make_eki_list [omotesando] = [{namae = "表参道"; saitan_kyori = infinity; temae_list = []}]
let test3 = make_eki_list [omotesando; nogizaka] = [{namae = "表参道"; saitan_kyori = infinity; temae_list = []};
  {namae = "乃木坂"; saitan_kyori = infinity; temae_list = []}]
let test4 = make_eki_list [omotesando; nogizaka; akasaka] = [{namae = "表参道"; saitan_kyori = infinity; temae_list = []};
  {namae = "乃木坂"; saitan_kyori = infinity; temae_list = []};
  {namae = "赤坂"; saitan_kyori = infinity; temae_list = []}]
