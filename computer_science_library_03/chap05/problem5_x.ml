(* 5.2 *)
(* 目的: 時間を受け取ったら午前か午後かを返す *)
(* jikan: int -> string *)
let jikan time = if time < 12 then "午前" else "午後"

(* テスト *)
let jikan_test1 = jikan 0 = "午前"
let jikan_test2 = jikan 12 = "午後"
let jikan_test3 = jikan 13 = "午後"

(* 5.3 *)
(* 目的: 誕生日 (月と日) を受け取ったら星座を返す *)
(* seiza: int -> int -> string *)
let yagi month day        = (month = 12 && (22 <= day && day <= 31)) || (month = 1 &&  (1 <= day && day <= 19))
let mizugame month day    = (month =  1 && (20 <= day && day <= 31)) || (month = 2 &&  (1 <= day && day <= 18))
let uo month day          = (month =  2 && (19 <= day && day <= 28)) || (month = 3 &&  (1 <= day && day <= 20))
let ohitsuji month day    = (month =  3 && (21 <= day && day <= 31)) || (month = 4 &&  (1 <= day && day <= 19))
let oushi month day       = (month =  4 && (20 <= day && day <= 30)) || (month = 5 &&  (1 <= day && day <= 20))
let futago month day      = (month =  5 && (21 <= day && day <= 31)) || (month = 6 &&  (1 <= day && day <= 21))
let kani month day        = (month =  6 && (22 <= day && day <= 30)) || (month = 7 &&  (1 <= day && day <= 22))
let shishi month day      = (month =  7 && (23 <= day && day <= 31)) || (month = 8 &&  (1 <= day && day <= 22))
let otome month day       = (month =  8 && (23 <= day && day <= 31)) || (month = 9 &&  (1 <= day && day <= 22))
let tenbin month day      = (month =  9 && (23 <= day && day <= 30)) || (month = 10 && (1 <= day && day <= 23))
let sasori month day      = (month = 10 && (24 <= day && day <= 31)) || (month = 11 && (1 <= day && day <= 22))
let ite month day         = (month = 11 && (23 <= day && day <= 30)) || (month = 12 && (1 <= day && day <= 21))

let seiza month day =
       if yagi month day     then "山羊座"
  else if mizugame month day then "水瓶座"
  else if uo month day       then "魚座"
  else if ohitsuji month day then "牡羊座"
  else if oushi month day    then "牡牛座"
  else if futago month day   then "双子座"
  else if kani month day     then "蟹座"
  else if shishi month day   then "獅子座"
  else if otome month day    then "乙女座"
  else if tenbin month day   then "天秤座"
  else if sasori month day   then "蠍座"
  else if ite month day      then "射手座"
  else "該当なし"

let seiza_test1 = seiza 1 5 = "山羊座"
let seiza_test2 = seiza 4 2 = "牡羊座"
let seiza_test3 = seiza 7 1 = "蟹座"
let seiza_test4 = seiza 10 6 = "天秤座"
let seiza_test5 = seiza 12 2 = "射手座"
