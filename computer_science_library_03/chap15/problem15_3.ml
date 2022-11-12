(* エラトステネスの篩に基づいて、2 以上 n 以下の自然数のリストを受け取ったら 2 以上 n 以下の素数のリストを返す *)
let rec enumerate n = if n = 1 then [] else n :: (enumerate (n - 1))
let make_list n = List.rev (enumerate n)

(* sieve: int list -> int list *)
let rec sieve nlst = match nlst with
    [] -> []
  | first::rest -> first :: (sieve (List.filter (fun n -> n mod first != 0) rest))

let test1 = sieve [] = []
let test2 = sieve (make_list 2) = [2]
let test3 = sieve (make_list 5) = [2; 3; 5]
let test4 = sieve (make_list 20) = [2; 3; 5; 7; 11; 13; 17; 19]
let test5 = sieve (make_list 50) = [2; 3; 5; 7; 11; 13; 17; 19; 23; 29; 31; 37; 41; 43; 47]
