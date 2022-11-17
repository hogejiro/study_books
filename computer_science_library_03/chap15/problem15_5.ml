(* eki_t list 型のリストを受け取ったら最短距離最小の駅と最短距離最小の駅以外からなるリストの組を返す *)
(* saitan_wo_bunri: eki_t list -> (eki_t, eki_t list) *)
#use "../chap12/problem12_1.ml"

let rec saitan_wo_bunri elst =
  List.fold_right (fun first (ek, eklst) ->
    match (first, ek) with
      ({namae = f1; saitan_kyori = s1; temae_list = t1},
       {namae = f2; saitan_kyori = s2; temae_list = t2}) ->
        if s1 < s2 then (first, ek::eklst)
                   else (ek, first::eklst))
                   elst ({namae = ""; saitan_kyori = infinity; temae_list = []}, [])

let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []}
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]}
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]}
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []}

let lst = [eki1; eki2; eki3; eki4]

let test = saitan_wo_bunri lst = (eki3, [eki1; eki2; eki4])  
