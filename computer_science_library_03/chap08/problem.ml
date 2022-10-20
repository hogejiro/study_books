(* 8.1 *)
type book_t = {
  title : string ;
  author : string ;
  publisher : string ;
  price : int ;
  isbn : string ;
}

let nazo_book = { title = "謎の本"; author = "田中太郎"; publisher = "エア出版"; price = 0 ; isbn = "978-4-0000-0000-0"; }
let programming_kiso = { title = "プログラミングの基礎"; author = "浅井健一"; publisher = "サイエンス社"; price = 2530 ; isbn = "978-4-7819-1160-1"; }
let programming_uso = { title = "プログラミングのウソ"; author = "深井健兆"; publisher = "秘密結社"; price = 4649 ; isbn = "978-4-4649-4649-X"; }

(* 8.2 *)
type okozukai_t = {
  purchased_item : string ;
  purchased_price : int ;
  purchased_place : string ;
  purchased_date : string ;
}

let apple = { purchased_item = "りんご"; purchased_price = 198; purchased_place = "果物屋"; purchased_date = "2022-10-19"; }
let ipad = { purchased_item = "iPad"; purchased_price = 39800; purchased_place = "電気屋"; purchased_date = "2022-10-18"; }
let pen = { purchased_item = "アップルペンシル"; purchased_price = 25800; purchased_place = "電気屋"; purchased_date = "2022-10-18"; }

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

(* 8.4 *)
(* person_t 型のデータを受け取ったら「○○さんの血液型は△型です」という文字列を返す *)
(* ketsueki_hyoji: person_t -> string *)
let ketsueki_hyoji person = match person with
  {namae = n; shincho = s; taiju = ta; tanjoubi = tb; ketsuekigata = k} -> n ^ "さんの血液型は" ^ k ^ "型です"

let kt_test1 = ketsueki_hyoji fuga = "fugaさんの血液型はA型です"
let kt_test2 = ketsueki_hyoji hoge = "hogeさんの血液型はO型です"
let kt_test3 = ketsueki_hyoji foo = "fooさんの血液型はB型です"

(* 8.5 *)
type ekimei_t = {
  kanji : string ;
  kana : string ;
  romaji : string ;
  shozoku : string ;
}

(* 8.6 *)
(* ekimei_t 型のデータを受け取ったら「路線名, 駅名（かな）」という文字列を返す *)
(* hyoji: ekimei_t -> string *)
let hyoji ekimei = match ekimei with
  {kanji = kj; kana = kn; romaji = rj; shozoku = sz} -> sz ^ ", " ^ kj ^ "（" ^ kn ^ "）"

let myogadani = {kanji = "茗荷谷"; kana = "みょうがだに"; romaji = "myogadani"; shozoku = "丸ノ内線" }
let shinkoiwa = {kanji = "新小岩"; kana = "しんこいわ"; romaji = "shinkoiwa"; shozoku = "総武線" }
let azabujuban = {kanji = "麻布十番"; kana = "あざぶじゅうばん"; romaji = "azabujuban"; shozoku = "大江戸線" }

let hyoji_test1 = hyoji myogadani = "丸ノ内線, 茗荷谷（みょうがだに）"
let hyoji_test2 = hyoji shinkoiwa = "総武線, 新小岩（しんこいわ）"
let hyoji_test3 = hyoji azabujuban = "大江戸線, 麻布十番（あざぶじゅうばん）"

(* 8.7 *)
type ekikan_t = {
  kiten : string ;
  shuten : string ;
  keiyu : string ;
  kyori : float ;
  jikan : int ;
}
