(* 4.1 *)
let kihonkyu = 850
let shokyu = 100
let baito_kyuyo nensu jikan = (kihonkyu + shokyu * nensu) * jikan

(* 4.2 *)
let jikoshokai namae = "私の名前は" ^ namae ^ "です"

(* 4.3 *)
let hyojun_taiju shincho = (shincho ** 2.0) *. 22.0

(* 4.4 *)
let bmi shincho taiju = taiju /. (shincho ** 2.0)

(* 4.5 *)
(*
baito_kyuyo: int -> int -> int
jikoshokai: string -> string
hyojun_taiju: float -> float
bmi: float -> float -> float
*)

(* 4.6 *)
(* 目的: 鶴の数を与えられたら足の本数を返す *)
(* tsuru_no_ashi: int -> int *)
let tsuru_no_ashi kazu = kazu * 2

(* テスト *)
let tsuru_test1 = tsuru_no_ashi 10 = 20
let tsuru_test2 = tsuru_no_ashi 20 = 40
let tsuru_test3 = tsuru_no_ashi 30 = 60

(* 目的: 亀の数を与えられたら足の本数を返す *)
(* kame_no_ashi: int -> int *)
let kame_no_ashi kazu = kazu * 4

(* テスト *)
let kame_test1 = kame_no_ashi 0 = 0
let kame_test2 = kame_no_ashi 1 = 4
let kame_test3 = kame_no_ashi 5 = 20

(* 4.7 *)
(* 目的: 鶴の数と亀の数を与えられたら足の数の合計を返す *)
(* tsurukame_no_ashi: int -> int -> int *)
let tsurukame_no_ashi tsuru kame = tsuru_no_ashi tsuru + kame_no_ashi kame

(* テスト *)
let tsurukameashi_test1 = tsurukame_no_ashi 0 0 = 0
let tsurukameashi_test2 = tsurukame_no_ashi 1 2 = 10
let tsurukameashi_test3 = tsurukame_no_ashi 4 3 = 20

(* 4.8 *)
(* 目的: 鶴と亀の数の合計と足の数の合計を与えられたら、鶴の数を返す *)
(* tsurukame: int -> int -> int *)
let tsurukame kazu_goukei ashi_goukei = (kazu_goukei * 4 - ashi_goukei) / 2

(* テスト *)
let tsurukame_test1 = tsurukame 0 0 = 0
let tsurukame_test2 = tsurukame 2 6 = 1
let tsurukame_test3 = tsurukame 10 32 = 4
