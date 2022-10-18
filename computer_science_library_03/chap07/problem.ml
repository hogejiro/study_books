(* 7.1 *)
(* 5 教科の点数を与えられたら合計点と平均点を組にして返す *)
(* goukei_to_heikin int -> int -> int -> int -> int -> int * int *)
let goukei_to_heikin kokugo suugaku eigo rika shakai = 
  (kokugo + suugaku + eigo + rika + shakai, (kokugo + suugaku + eigo + rika + shakai) / 5)

let gth_test1 = goukei_to_heikin 10 20 30 40 50 = (150, 30)
let gth_test2 = goukei_to_heikin 100 100 100 100 100 = (500, 100)
let gth_test3 = goukei_to_heikin 0 0 0 0 0 = (0, 0)

(* 7.2 *)
(* 名前と成績の組を受け取ったら「○○さんの評価は△です」という文字列を返す *)
(* seiseki: string * string -> string *)
let hyouka pair = match pair with
 (namae, seiseki) -> namae ^ "さんの評価は" ^ seiseki ^ "です"

 let hyouka_test1 = hyouka ("山田", "A") = "山田さんの評価はAです"
 let hyouka_test2 = hyouka ("田中", "B") = "田中さんの評価はBです"
 let hyouka_test3 = hyouka ("駄目", "F") = "駄目さんの評価はFです"
 