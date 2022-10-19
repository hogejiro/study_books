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
 
(* 7.3 *)
(* x,y 座標の組で表された平面座標を受け取ったら x 軸について対象な点の座標を返す *)
(* taisho_x: float * float -> float * float *)
let taisho_x pair = match pair with
  (x, y) -> (x, -. y)

let tx_test1 = taisho_x (1., 3.) = (1., -3.)
let tx_test2 = taisho_x (-10., -5.) = (-10., 5.)
let tx_test3 = taisho_x (0., 0.) = (0., 0.)

(* 7.4 *)
(* x,y 座標の組で表された平面座標を 2 つ受け取ったらその中点の座標を返す *)
(* chuten: float * float -> float * float -> float * float *)
let chuten pair1 pair2 = match pair1 with
  (x1, y1) -> match pair2 with
    (x2, y2) -> ((x1 +. x2) /. 2., (y1 +. y2) /. 2.)

let c_test1 = chuten (0., 0.) (0., 0.) = (0., 0.)
let c_test2 = chuten (1., 3.) (-5., -1.) = (-2., 1.)
let c_test3 = chuten (7., 7.) (-7., -7.) = (0., 0.)
