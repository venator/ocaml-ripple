open Lwt
open Ripple_api_t

(* Help *)

let commands = [
  ("server_info", `Server_info);
  ("server_state", `Server_state);
]

let print_commands () =
  let commands, _ = List.split commands in
  let commands = List.sort String.compare commands in
  Lwt_io.printf "Available commands: %s\n" (String.concat ", " commands)

(* Ripple sender *)

let rec prompt ~push =
  let send_command cmd =
    push cmd;
    prompt ~push
  in
  Lwt_io.print "> " >>= fun () ->
  Lwt_io.read_line Lwt_io.stdin >>= fun cmd ->
    try
      send_command (List.assoc cmd commands)
    with
    | Not_found ->
        print_commands () >>= fun () ->
        prompt ~push

(* Ripple receiver *)

let rec response_handler ~stream ~push =
  Lwt_stream.next stream >>= fun response ->
  (* TODO: get response instead of string, see [ripple.ml] *)
  (* Lwt_io.printl (Ripple_api_j.string_of_response response) >>= *)
  Lwt_io.printl response >>= fun () ->
  response_handler ~stream ~push

(* Ripple handler *)

let ripple_handler (stream, push) =
  prompt ~push <&> response_handler ~stream ~push

(* Main *)

let main () =
  Lwt_io.printl "**** Ripple Test Client ****" >>= fun () ->
  print_commands () >>= fun () ->
  let server_url =
    if Array.length Sys.argv < 2 then "wss://s-east.ripple.com"
    else Sys.argv.(1) in
  Lwt_io.printf "Connecting to %s...\n" server_url >>= fun () ->
  Ripple.with_connection (Uri.of_string server_url) ripple_handler

let () =
  Lwt_main.run (main ())
