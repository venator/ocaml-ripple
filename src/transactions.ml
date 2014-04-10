open Lwt
open Ripple

let main () =
  with_transactions (Uri.of_string "wss://s-east.ripple.com") >>= fun trs ->
  Lwt_stream.iter (fun t -> Printf.printf "%s\n%!" t) trs

let () = Lwt_main.run (main ())
