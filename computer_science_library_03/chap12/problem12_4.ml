(* ekimei_t 型のリストを受け取ったらひらがなの順に整列し駅の重複を取り除いた ekimei_t 型のリストを返す *)
(* seiretsu: ekimei_t list -> ekimei_t list *)
#use "../chap09/problem9_09.ml"

(* ひらがな順に昇順の ekimei_t 型のリストと ekimei_t 型の値を受け取ったらそれを組み込んだリストを返す *)
let rec sounyu emlst em = match em with
  {kanji=k1; kana=kn1; romaji=r1; shozoku=s1} -> match emlst with
      [] -> [em]
    | {kanji=k2; kana=kn2; romaji=r2; shozoku=s2} as first::rest ->
      if r1 > r2
        then first::sounyu rest em
        else if r1 = r2
          then em::rest
          else em::first::rest

let rec seiretsu emlst = match emlst with
    [] -> []
  | {kanji = k; kana = kn; romaji = r; shozoku = s} as first::rest ->
    sounyu (seiretsu rest) first

let elst1 = [{kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}]
let elst2 = [{kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}; 
{kanji="外苑前"; kana="がいえんまえ"; romaji="gaienmae"; shozoku="銀座線"}; 
{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="半蔵門線"}]
let elst3 = [{kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}; 
{kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="有楽町線"}; 
{kanji="外苑前"; kana="がいえんまえ"; romaji="gaienmae"; shozoku="銀座線"}; 
{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="銀座線"}; 
{kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="半蔵門線"}]

let test1 = seiretsu [] = []
let test1 = seiretsu elst1 = elst1
let test3 = seiretsu elst2 = [
  {kanji="外苑前"; kana="がいえんまえ"; romaji="gaienmae"; shozoku="銀座線"}; 
  {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}; 
  {kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="半蔵門線"}; 
]
let test4 = seiretsu elst3 = [
  {kanji="外苑前"; kana="がいえんまえ"; romaji="gaienmae"; shozoku="銀座線"}; 
  {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}; 
  {kanji="渋谷"; kana="しぶや"; romaji="shibuya"; shozoku="銀座線"}; 
]
