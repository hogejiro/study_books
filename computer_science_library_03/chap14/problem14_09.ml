(* person_t 型のリストを受け取ってきたら、その名前フィールドを取り出す *)
type person_t = {
  namae : string ;
  shincho : float ;
  taiju : float ;
  tanjoubi : int * int ;
  ketsuekigata : string ;
};;

let fuga = { namae = "fuga"; shincho = 170.; taiju = 50.; tanjoubi = (1, 1); ketsuekigata = "A" }
let hoge = { namae = "hoge"; shincho = 148.; taiju = 45.; tanjoubi = (6, 6); ketsuekigata = "O" }
let foo = { namae = "foo"; shincho = 190.; taiju = 80.; tanjoubi = (12, 12); ketsuekigata = "B" }

fun plst -> List.map (fun p -> match p with { namae = n; shincho = s; taiju = tj; tanjoubi = tb; ketsuekigata = k } -> n) plst
