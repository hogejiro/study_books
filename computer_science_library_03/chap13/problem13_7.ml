(* 直前に確定した駅 (eki_t 型) と未確定の駅リストを受け取ったら必要な更新処理を行った後の未確定の駅リストを返す *)
(* koushin1: eki_t -> eki_t list -> eki_t list  *)
#use "../chap10/problem10_11.ml"
#use "../chap12/problem12_1.ml"
#use "problem13_6.ml"

let koushin p qlst = List.map (koushin1 p) qlst

let qlst1 = [eki1]
let qlst2 = [eki1;eki2;eki3;eki4]

let test1 = koushin eki3 qlst1 = qlst1
let test2 = koushin eki3 qlst2 = [{namae = "池袋"; saitan_kyori = infinity; temae_list = []};
eki2;eki3;{namae = "後楽園"; saitan_kyori = 1.8; temae_list = ["後楽園"; "茗荷谷"]}]
let test3 = koushin eki2 qlst2 = [{namae = "池袋"; saitan_kyori = 3.; temae_list = ["池袋"; "新大塚"; "茗荷谷"]};
eki2;eki3;{namae = "後楽園"; saitan_kyori = infinity; temae_list = []}]
