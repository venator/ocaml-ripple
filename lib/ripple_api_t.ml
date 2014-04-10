(* Auto-generated from "ripple_api.atd" *)


type int64 = Int64.t

type positive = int

type error = [
    `MissingCommand | `UnknownStream | `TransactionNotFound | `ActNotFound
  | `InvalidParams | `UnknownCmd
]

type command = [
    `Server_info | `Server_state | `Ping | `Subscribe | `Unsubscribe
]

type request = { request_command (*atd command *): command }

type response_status = [ `Success | `Error ]

type response = {
  response_id (*atd id *): int64;
  response_status (*atd status *): response_status;
  response_error (*atd error *): error option;
  response_error_message (*atd error_message *): string option;
  response_request (*atd request *): request option
}
