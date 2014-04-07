open Ripple_t

(* Lwt operators *)

let (>>=) = Lwt.bind
let (=<<) f t = Lwt.bind t f
let (>|=) m f = Lwt.map f m
let (=|<) = Lwt.map
let (<?>) a b = Lwt.choose [a; b]
let (<&>) a b = Lwt.join [a; b]

(* Help *)

let commands = [
  ("server_info", `Server_info);
  ("server_state", `Server_state);
]

let print_commands () =
  let commands, _ = List.split commands in
  let commands = List.sort String.compare commands in
  Lwt_io.printf "Available commands: %s\n" (String.concat ", " commands)

(* Websocket sender *)

let rec prompt ~push () =
  let send_command c =
    let req = Ripple_j.string_of_request { request_command = c } in
    Lwt.wrap (fun () -> push (Some (Websocket.Frame.of_string req)))
    >>= prompt ~push
  in
  Lwt_io.print "> " >>= fun () ->
  Lwt_io.read_line Lwt_io.stdin >>= fun cmd ->
    try
      send_command (List.assoc cmd commands)
    with
    | Not_found -> print_commands () >>= prompt ~push

(* Websocket receiver *)

let rec response_handler ~stream ~push () =
  let open Websocket in
  Lwt_stream.next stream >>= fun frame ->
  match Frame.opcode frame with
  | `Ping ->
      push (Some (Frame.of_string ~opcode:`Pong ""));
      response_handler ~stream ~push ()
  | _ ->
      Lwt_io.printl (Websocket.Frame.content frame) >>=
      response_handler ~stream ~push

(* Websocket handler *)

let ripple_handler (stream, push) =
  prompt ~push () <&> response_handler ~stream ~push ()

(* Main *)

let main () =
  Lwt_io.printl "**** Ripple Test Client ****" >>= fun () ->
  print_commands () >>= fun () ->
  let server_url =
    if Array.length Sys.argv < 2 then "wss://s-east.ripple.com"
    else Sys.argv.(1) in
  Lwt_io.printf "Connecting to %s...\n" server_url >>= fun () ->
  Websocket.with_connection (Uri.of_string server_url) ripple_handler

let () =
  Lwt_main.run (main ())
