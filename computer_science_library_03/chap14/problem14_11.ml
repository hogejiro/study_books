(* 12.2 *)
(* ekimei_t 型のリストを受け取ったらその駅名を使って eki_t 型のリストを作る *)
(* make_eki_list: ekimei_t list -> eki_t list *)
#use "../chap09/problem9_09.ml"
#use "../chap12/problem12_1.ml"

let make_eki_list emlst = List.map (fun et -> match et with {kanji = k; kana = kn; romaji = r; shozoku = s} ->
    {namae = k; saitan_kyori = infinity; temae_list = []}) emlst

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

(* 12.3 *)
(* eki_t 型のリストと起点(漢字)を受け取ったら起点のみ初期化された eki_t 型のリストを返す *)
(* shokika: eki_t list -> string -> eki_t list *)
let shokika elst kiten = match (List.map (fun e -> match e with {namae = n; saitan_kyori = s; temae_list = t} ->
                                           if kiten = n
                                             then {namae = kiten; saitan_kyori = 0.; temae_list = [kiten]}
                                             else {namae = n; saitan_kyori = s; temae_list = t}) elst) with
    [] -> [{namae = kiten; saitan_kyori = 0.; temae_list = [kiten]}]
  | other -> other

let test1 = shokika [] "表参道" = [{namae = "表参道"; saitan_kyori = 0.; temae_list = ["表参道"]}]
let test2 = shokika [] "乃木坂" = [{namae = "乃木坂"; saitan_kyori = 0.; temae_list = ["乃木坂"]}]
let test3 = shokika [] "赤坂" = [{namae = "赤坂"; saitan_kyori = 0.; temae_list = ["赤坂"]}]
let test4 = shokika [{namae = "赤坂"; saitan_kyori = 1.; temae_list = ["赤坂"]}] "赤坂" = [{namae = "赤坂"; saitan_kyori = 0.; temae_list = ["赤坂"]}]
