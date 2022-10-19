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
  shincho : float ;
  taiju : float ;
  tanjoubi : int * int ;
  ketsuekigata : string ;
}

let fuga = { shincho = 170.; taiju = 50.; tanjoubi = (1, 1); ketsuekigata = "A" }
let hoge = { shincho = 148.; taiju = 45.; tanjoubi = (6, 6); ketsuekigata = "O" }
let foo = { shincho = 190.; taiju = 80.; tanjoubi = (12, 12); ketsuekigata = "B" }
