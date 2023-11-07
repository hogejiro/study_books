(* 9.1 *)
let season = "春" :: "夏" :: "秋" :: "冬" :: []

(* 9.2 *)
(* 8.3 から引用 *)
type person_t = {
  namae : string ;
  shincho : float ;
  taiju : float ;
  tanjoubi : int * int ;
  ketsuekigata : string ;
}

let person1 = {namae = "a"; shincho = 150.; taiju = 40.; tanjoubi = (1, 1); ketsuekigata = "A"}
let person2 = {namae = "b"; shincho = 160.; taiju = 50.; tanjoubi = (2, 4); ketsuekigata = "B"}
let person3 = {namae = "c"; shincho = 170.; taiju = 60.; tanjoubi = (8, 16); ketsuekigata = "AB"}

let three_p = person1 :: person2 :: person3 :: []

(* 9.3 *)
let season2 = ["春"; "夏"; "秋"; "冬"]
let season_test = season = season2

(* 9.4 *)
(* 整数のリストを受け取ったらリストの長さを返す *)
(* length: int list -> int *)
let rec length lst = match lst with
    [] -> 0
  | first::rest -> 1 + length rest

let length_test1 = length [] = 0
let length_test2 = length [1] = 1
let length_test2 = length [1; 2; 3; 4; 5] = 5

(* 9.5 *)
(* 整数のリストを受け取ったら、その中の偶数の要素のみを含むリストを返す *)
(* even: int list -> int list *)
let rec even lst = match lst with
    [] -> []
  | first::rest -> if first mod 2 = 0 then first :: even rest
                                      else even rest

let even_test1 = even [2; 1; 6; 4; 7] = [2; 6; 4]
let even_test2 = even [] = []
let even_test3 = even [4; 1; 1; 1; 1; 1; 1; 1; 8 ] = [4; 8]

(* 9.6 *)
(* 文字列のリストを受け取ったら、その中の要素を前から順に全部くっつけた文字列を返す *)
(* concat: string list -> string *)
let rec concat lst = match lst with
    [] -> ""
  | first::rest -> first ^ concat rest

let concat_test1 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"
let concat_test2 = concat [] = ""
let concat_test3 = concat ["無"] = "無"
let concat_test4 = concat ["精神"; "統一"] = "精神統一"
let concat_test5 = concat ["子"; "丑"; "寅"; "卯"; "辰"; "巳"; "午"; "未"; "申"; "酉"; "戌"; "亥"] = "子丑寅卯辰巳午未申酉戌亥"
let concat_test6 = concat [""; "塵地螺鈿飾"; ""; "剣"] = "塵地螺鈿飾剣"

(* 9.7 *)
(* person_t 型のデータのリストを受け取ったら血液型 A 型の人の数を返す *)
(* count_ketsueki_A: person_t list -> int *)
(* 9.2 で person_t を import 済 *)
let person4 = {namae = "d"; shincho = 150.; taiju = 40.; tanjoubi = (7, 31); ketsuekigata = "A"}
let person5 = {namae = "e"; shincho = 150.; taiju = 40.; tanjoubi = (8, 31); ketsuekigata = "A"}
let person6 = {namae = "f"; shincho = 170.; taiju = 40.; tanjoubi = (9, 30); ketsuekigata = "A"}
let person7 = {namae = "g"; shincho = 190.; taiju = 55.; tanjoubi = (9, 20); ketsuekigata = "O"}


let rec count_ketsueki_A plst = match plst with
    [] -> 0
  | { namae = n; shincho = s; taiju = t; tanjoubi = tj; ketsuekigata = k}::rest ->
      if k = "A" then 1 + count_ketsueki_A rest
                 else count_ketsueki_A rest

let ck_test1 = count_ketsueki_A [] = 0
let ck_test2 = count_ketsueki_A [person1; person2; person3] = 1
let ck_test3 = count_ketsueki_A [person1; person2; person3; person4; person5] = 3
let ck_test4 = count_ketsueki_A [person5; person4; person1] = 3

(* 9.8 *)
(* person_t 型のデータのリストを受け取ったら乙女座の人の名前のみからなるリストを返す *)
(* otomeza: person_t list -> string list *)
let otome pair = match pair with
  (month, day) -> (month =  8 && (23 <= day && day <= 31)) || (month = 9 &&  (1 <= day && day <= 22))
let rec otomeza lst = match lst with
    [] -> []
  | { namae = n; shincho = s; taiju = t; tanjoubi = tj; ketsuekigata = k}::rest -> 
    if otome tj then n :: otomeza rest
                else otomeza rest

let ot_test1 = otomeza [] = []
let ot_test2 = otomeza [person1; person2; person3] = []
let ot_test3 = otomeza [person1; person2; person3; person4; person5] = ["e"]
let ot_test4 = otomeza [person1; person2; person3; person4; person5; person6] = ["e"]
let ot_test4 = otomeza [person5; person6; person7] = ["e"; "g"]
