(* ekimei_t 型のリストと起点(漢字)を受け取ったら起点のみ初期化された eki_t 型のリストを返す *)
(* この関数の無名関数は、14.11 の make_eki_list と shokika それぞれの無名関数の合成関数として機能する *)
(* make_initial_eki_list: ekimei_t list -> string -> eki_t list *)
#use "../chap09/problem9_09.ml"
#use "../chap12/problem12_1.ml"

let make_initial_eki_list elst kiten = match (List.map 
  (fun e -> match e with {kanji = k; kana = kn; romaji = r; shozoku = s} ->
    if kiten = k
      then {namae = kiten; saitan_kyori = 0.; temae_list = [kiten]}
      else {namae = k; saitan_kyori = infinity; temae_list = []})
  elst) with
    [] -> [{namae = kiten; saitan_kyori = 0.; temae_list = [kiten]}]
  | other -> other

let omotesando =  {kanji="表参道"; kana="おもてさんどう"; romaji="omotesandou"; shozoku="千代田線"}
let nogizaka = {kanji="乃木坂"; kana="のぎざか"; romaji="nogizaka"; shozoku="千代田線"}
let akasaka = {kanji="赤坂"; kana="あかさか"; romaji="akasaka"; shozoku="千代田線"}
let test1 = make_initial_eki_list [] "表参道" = [{namae = "表参道"; saitan_kyori = 0.; temae_list = ["表参道"]}]
let test2 = make_initial_eki_list [omotesando] "表参道" = [{namae = "表参道"; saitan_kyori = 0.; temae_list = ["表参道"]}]
let test3 = make_initial_eki_list [omotesando;akasaka] "赤坂" = [{namae = "表参道"; saitan_kyori = infinity; temae_list = []}; {namae = "赤坂"; saitan_kyori = 0.; temae_list = ["赤坂"]}]
let test4 = make_initial_eki_list [omotesando;nogizaka;akasaka] "赤坂" = [{namae = "表参道"; saitan_kyori = infinity; temae_list = []}; {namae = "乃木坂"; saitan_kyori = infinity; temae_list = []}; {namae = "赤坂"; saitan_kyori = 0.; temae_list = ["赤坂"]}]
