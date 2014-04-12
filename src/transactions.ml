open Lwt
open Ripple
open Ripple_api_j

let main () =
  with_transactions (Uri.of_string "wss://s-east.ripple.com") >>= fun trs ->
  Lwt_stream.iter (fun t ->
      Printf.printf "%s\n%!" t;
      let t = transaction_of_string t in
      Printf.printf "%s\n%!" (string_of_transaction t)) trs

let () = Lwt_main.run (main ())
