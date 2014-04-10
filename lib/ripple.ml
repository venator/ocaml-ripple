open Lwt
open Ripple_api_t

(*
module type RIPPLE_CONFIG = sig
  val server : Uri.t
  val handler : Ripple_api_t.response -> unit Lwt.t
end

module Make = functor (RC : RIPPLE_CONFIG) ->
struct

  (** {2 A Websocket connection} *)

  let rec response_handler ~stream ~push () =
    let open Websocket in
    Lwt_stream.next stream >>= fun frame ->
    begin
      match Frame.opcode frame with
      | `Ping ->
        push (Some (Frame.of_string ~opcode:`Pong ""))
      | _ ->
        Websocket.Frame.content frame
        |> Ripple_api_j.response_of_string
        |> RC.handler
    end
    >>= response_handler ~stream ~push ~handler

  let websocket_connection =
    Websocket.open_connection RC.server >>= (stream, push) ->
    Lwt.async (response_handler ~stream ~push);
    stream, push

  (** {2 Low-level functions} *)

  let send_command cmd =
    websocket_connection >>= fun (_stream, push) ->
    let cmd_str = Ripple_api_t.string_of_command cmd in
    let req = Ripple_api_j.string_of_request { request_command = cmd_str } in
    Lwt.wrap (fun () -> push (Some (Websocket.Frame.of_string req)))

  (** {2 High-level commands} *)

  let server_info () =
    send_command `Server_info

  let server_state () =
    send_command `Server_info

end

module Default_config = struct

  let server =
    Uri.of_string "wss://s-east.ripple.com"

  let handler response =
    let response_str = Ripple_api_j.string_of_response response in
    Lwt_io.printl response_str

end
*)

let ping_handler ~push frame =
  match Websocket.Frame.opcode frame with
  | `Ping ->
    push (Some (Websocket.Frame.of_string ~opcode:`Pong ""));
    None
  | _ ->
    Some frame

let response_handler frame =
  Websocket.Frame.content frame
  (* TODO: use [response_handler] to transform string to responses
   * defined in ATD file. *)
  (* |> Ripple_api_j.response_of_string *)

let open_connection uri =
  Websocket.open_connection uri >>= fun (ws_stream, ws_pushfun) ->
  let stream =
    Lwt_stream.filter_map (ping_handler ~push:ws_pushfun) ws_stream
    |> Lwt_stream.map response_handler in
  Lwt.return (stream, ws_pushfun)

let with_transactions uri =
  open_connection uri >>= fun (stream, pushfun) ->
  pushfun (Some (Websocket.Frame.of_string "{ \"command\": \"subscribe\", \"streams\": [\"transactions\"]}"));
  Lwt.return stream

let with_connection server ripple_handler =
  let handler (stream_ws, push_ws) =
    let stream =
      Lwt_stream.filter_map (ping_handler ~push:push_ws) stream_ws
      |> Lwt_stream.map response_handler
    in
    let push cmd =
      let req = Ripple_api_j.string_of_request { request_command = cmd } in
      push_ws (Some (Websocket.Frame.of_string req))
    in
    ripple_handler (stream, push)
  in
  Websocket.with_connection server handler
