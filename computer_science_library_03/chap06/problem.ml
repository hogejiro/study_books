(* 6.1 *)
(* this file has error *)
let square x = x * x ;;
square 3. ;; (* type error *)

let circle = 2. * pi * r ;;
circle 2. ;; (* type error *)

let TV bangumi youbi = bangumi ^ "は" ^ youbi ^ "に放映です。" ;;
TV "ポケモン" "木曜日" ;; (* syntax error *)
