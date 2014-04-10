open Ripple_t

module Option = struct

  let is_none = function
    | None -> true
    | Some _ -> false

  let is_some = function
    | None -> false
    | Some _ -> true

end

(* Check if [c] is between A (65) and Z (90) *)
let ascii_uppercase c =
  let n = Char.code c in
  n >= 65 && n <= 90

(* Check that [s] is not empty,
   and [f c] is true for every character [c] of [s].
 *)
let validate_string ~f s =
  s <> "" &&
    try
      String.iter (fun c -> if not (f c) then raise Exit) s;
      true
    with Exit ->
      false

let validate_currency = function
  | `Xrp -> true
  (* Currency code must be of the form 'XXX' *)
  | `Code x ->
    if String.length x = 3 then
      validate_string ~f:ascii_uppercase x
    else
      false
