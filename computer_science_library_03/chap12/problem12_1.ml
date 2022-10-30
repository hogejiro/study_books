(* 駅名、最短距離、駅名のリストをフィールドとして持つレコード型 *)
type eki_t = {
  namae : string;
  saitan_kyori : float;
  temae_list : string list;
}
