(* 文字列のリストを受け取ったら、その中の要素を前から順に全部くっつけた文字列を返す *)
(* concat: string list -> string *)
let rec concat lst = List.fold_right (^) lst ""

let concat_test1 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"
let concat_test2 = concat [] = ""
let concat_test3 = concat ["無"] = "無"
let concat_test4 = concat ["精神"; "統一"] = "精神統一"
let concat_test5 = concat ["子"; "丑"; "寅"; "卯"; "辰"; "巳"; "午"; "未"; "申"; "酉"; "戌"; "亥"] = "子丑寅卯辰巳午未申酉戌亥"
let concat_test6 = concat [""; "塵地螺鈿飾"; ""; "剣"] = "塵地螺鈿飾剣"
