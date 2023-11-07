(* 直前に確定した駅 (eki_t 型) と未確定の駅リストを受け取ったら必要な更新処理を行った後の未確定の駅リストを返す *)
(* koushin1: eki_t -> eki_t list -> eki_t list  *)
#use "../chap10/problem10_11.ml"
#use "../chap12/problem12_1.ml"

let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []}
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]}
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]}
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []}

let koushin p qlst =
  let koushin1 p q = match (p, q) with
    ({namae = pn; saitan_kyori = ps; temae_list = pt},
     {namae = qn; saitan_kyori = qs; temae_list = qt}) ->
     let kyori = get_ekikan_kyori pn qn global_ekikan_list in
     if kyori = infinity
       then q
       else if ps +. kyori < qs
            then {namae = qn; saitan_kyori = ps +. kyori; temae_list = qn::pt}
            else q
  in List.map (koushin1 p) qlst

let qlst1 = [eki1]
let qlst2 = [eki1;eki2;eki3;eki4]

let test1 = koushin eki3 qlst1 = qlst1
let test2 = koushin eki3 qlst2 = [{namae = "池袋"; saitan_kyori = infinity; temae_list = []};
eki2;eki3;{namae = "後楽園"; saitan_kyori = 1.8; temae_list = ["後楽園"; "茗荷谷"]}]
let test3 = koushin eki2 qlst2 = [{namae = "池袋"; saitan_kyori = 3.; temae_list = ["池袋"; "新大塚"; "茗荷谷"]};
eki2;eki3;{namae = "後楽園"; saitan_kyori = infinity; temae_list = []}]
