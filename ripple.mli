(* Auto-generated from "ripple.atd" *)


type int64 = Int64.t

type positive = int

type last_close = {
  last_close_converge_time_s (*atd converge_time_s *): float;
  last_close_proposers (*atd proposers *): int
}

type server_state = [ `Full ]

type validated_ledger = {
  validated_ledger_age (*atd age *): int;
  validated_ledger_base_fee_xrp (*atd base_fee_xrp *): float;
  validated_ledger_hash (*atd hash *): string;
  validated_ledger_reserve_base_xrp (*atd reserve_base_xrp *): int;
  validated_ledger_reserve_inc_xrp (*atd reserve_inc_xrp *): int;
  validated_ledger_seq (*atd seq *): int64
}

type load_base = int

type load_factor = int

type base_info = {
  info_build_version (*atd build_version *): string;
  info_complete_ledgers (*atd complete_ledgers *): string;
  info_hostid (*atd hostid *): string option;
  info_last_close (*atd last_close *): last_close;
  info_load_base (*atd load_base *): load_base option;
  info_load_factor (*atd load_factor *): load_factor;
  info_peers (*atd peers *): int;
  info_pubkey_node (*atd pubkey_node *): string;
  info_server_state (*atd server_state *): server_state;
  info_validated_ledger (*atd validated_ledger *): validated_ledger;
  info_validation_quorum (*atd validation_quorum *): int
}

type info = base_info

type state = base_info

type info_command = [ `Server_info | `Server_state | `Ping ]

type info_request = {
  info_request_id (*atd id *): int64;
  info_request_command (*atd command *): info_command
}

type subscription_command = [ `Subscribe | `Unsubscribe ]

type stream = string

type account = string

type subscription_request = {
  subscription_request_id (*atd id *): int64;
  subscription_request_command (*atd command *): subscription_command;
  subscription_request_accounts (*atd accounts *): account list;
  subscription_request_streams (*atd streams *): stream list
}

type ledger_command = [ `Ledger ]

type ledger_request = {
  ledger_request_id (*atd id *): int64;
  ledger_request_command (*atd command *): ledger_command;
  ledger_request_full (*atd full *): bool;
  ledger_request_expand (*atd expand *): bool;
  ledger_request_transactions (*atd transactions *): bool;
  ledger_request_accounts (*atd accounts *): bool
}

type status = [ `Success ]

type type_ = [ `Response ]

type result = {
  result_info (*atd info *): info option;
  result_state (*atd state *): state option;
  result_fee_base (*atd fee_base *): int option;
  result_fee_ref (*atd fee_ref *): int option;
  result_ledger_hash (*atd ledger_hash *): string option;
  result_ledger_index (*atd ledger_index *): int64 option;
  result_ledger_time (*atd ledger_time *): int64 option;
  result_load_base (*atd load_base *): int option;
  result_load_factor (*atd load_factor *): load_factor option;
  result_random (*atd random *): string option;
  result_reserve_base (*atd reserve_base *): int64 option;
  result_reserve_inc (*atd reserve_inc *): int64 option;
  result_server_status (*atd server_status *): server_state option;
  result_validated_ledgers (*atd validated_ledgers *): string option
}

type response = {
  response_id (*atd id *): int64;
  response_status (*atd status *): status;
  response_type_ (*atd type_ *): type_;
  response_result (*atd result *): result
}

val write_int64 :
  Bi_outbuf.t -> int64 -> unit
  (** Output a JSON value of type {!int64}. *)

val string_of_int64 :
  ?len:int -> int64 -> string
  (** Serialize a value of type {!int64}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_int64 :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> int64
  (** Input JSON data of type {!int64}. *)

val int64_of_string :
  string -> int64
  (** Deserialize JSON data of type {!int64}. *)


val write_positive :
  Bi_outbuf.t -> positive -> unit
  (** Output a JSON value of type {!positive}. *)

val string_of_positive :
  ?len:int -> positive -> string
  (** Serialize a value of type {!positive}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_positive :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> positive
  (** Input JSON data of type {!positive}. *)

val positive_of_string :
  string -> positive
  (** Deserialize JSON data of type {!positive}. *)


val write_last_close :
  Bi_outbuf.t -> last_close -> unit
  (** Output a JSON value of type {!last_close}. *)

val string_of_last_close :
  ?len:int -> last_close -> string
  (** Serialize a value of type {!last_close}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_last_close :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> last_close
  (** Input JSON data of type {!last_close}. *)

val last_close_of_string :
  string -> last_close
  (** Deserialize JSON data of type {!last_close}. *)

val create_last_close :
  last_close_converge_time_s: float ->
  last_close_proposers: int ->
  unit -> last_close
  (** Create a record of type {!last_close}. *)


val write_server_state :
  Bi_outbuf.t -> server_state -> unit
  (** Output a JSON value of type {!server_state}. *)

val string_of_server_state :
  ?len:int -> server_state -> string
  (** Serialize a value of type {!server_state}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_server_state :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> server_state
  (** Input JSON data of type {!server_state}. *)

val server_state_of_string :
  string -> server_state
  (** Deserialize JSON data of type {!server_state}. *)


val write_validated_ledger :
  Bi_outbuf.t -> validated_ledger -> unit
  (** Output a JSON value of type {!validated_ledger}. *)

val string_of_validated_ledger :
  ?len:int -> validated_ledger -> string
  (** Serialize a value of type {!validated_ledger}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_validated_ledger :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> validated_ledger
  (** Input JSON data of type {!validated_ledger}. *)

val validated_ledger_of_string :
  string -> validated_ledger
  (** Deserialize JSON data of type {!validated_ledger}. *)

val create_validated_ledger :
  validated_ledger_age: int ->
  validated_ledger_base_fee_xrp: float ->
  validated_ledger_hash: string ->
  validated_ledger_reserve_base_xrp: int ->
  validated_ledger_reserve_inc_xrp: int ->
  validated_ledger_seq: int64 ->
  unit -> validated_ledger
  (** Create a record of type {!validated_ledger}. *)


val write_load_base :
  Bi_outbuf.t -> load_base -> unit
  (** Output a JSON value of type {!load_base}. *)

val string_of_load_base :
  ?len:int -> load_base -> string
  (** Serialize a value of type {!load_base}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_load_base :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> load_base
  (** Input JSON data of type {!load_base}. *)

val load_base_of_string :
  string -> load_base
  (** Deserialize JSON data of type {!load_base}. *)


val write_load_factor :
  Bi_outbuf.t -> load_factor -> unit
  (** Output a JSON value of type {!load_factor}. *)

val string_of_load_factor :
  ?len:int -> load_factor -> string
  (** Serialize a value of type {!load_factor}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_load_factor :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> load_factor
  (** Input JSON data of type {!load_factor}. *)

val load_factor_of_string :
  string -> load_factor
  (** Deserialize JSON data of type {!load_factor}. *)


val write_base_info :
  Bi_outbuf.t -> base_info -> unit
  (** Output a JSON value of type {!base_info}. *)

val string_of_base_info :
  ?len:int -> base_info -> string
  (** Serialize a value of type {!base_info}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_base_info :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> base_info
  (** Input JSON data of type {!base_info}. *)

val base_info_of_string :
  string -> base_info
  (** Deserialize JSON data of type {!base_info}. *)

val create_base_info :
  info_build_version: string ->
  info_complete_ledgers: string ->
  ?info_hostid: string ->
  info_last_close: last_close ->
  ?info_load_base: load_base ->
  info_load_factor: load_factor ->
  info_peers: int ->
  info_pubkey_node: string ->
  info_server_state: server_state ->
  info_validated_ledger: validated_ledger ->
  info_validation_quorum: int ->
  unit -> base_info
  (** Create a record of type {!base_info}. *)


val write_info :
  Bi_outbuf.t -> info -> unit
  (** Output a JSON value of type {!info}. *)

val string_of_info :
  ?len:int -> info -> string
  (** Serialize a value of type {!info}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_info :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> info
  (** Input JSON data of type {!info}. *)

val info_of_string :
  string -> info
  (** Deserialize JSON data of type {!info}. *)


val write_state :
  Bi_outbuf.t -> state -> unit
  (** Output a JSON value of type {!state}. *)

val string_of_state :
  ?len:int -> state -> string
  (** Serialize a value of type {!state}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_state :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> state
  (** Input JSON data of type {!state}. *)

val state_of_string :
  string -> state
  (** Deserialize JSON data of type {!state}. *)


val write_info_command :
  Bi_outbuf.t -> info_command -> unit
  (** Output a JSON value of type {!info_command}. *)

val string_of_info_command :
  ?len:int -> info_command -> string
  (** Serialize a value of type {!info_command}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_info_command :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> info_command
  (** Input JSON data of type {!info_command}. *)

val info_command_of_string :
  string -> info_command
  (** Deserialize JSON data of type {!info_command}. *)


val write_info_request :
  Bi_outbuf.t -> info_request -> unit
  (** Output a JSON value of type {!info_request}. *)

val string_of_info_request :
  ?len:int -> info_request -> string
  (** Serialize a value of type {!info_request}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_info_request :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> info_request
  (** Input JSON data of type {!info_request}. *)

val info_request_of_string :
  string -> info_request
  (** Deserialize JSON data of type {!info_request}. *)

val create_info_request :
  info_request_id: int64 ->
  info_request_command: info_command ->
  unit -> info_request
  (** Create a record of type {!info_request}. *)


val write_subscription_command :
  Bi_outbuf.t -> subscription_command -> unit
  (** Output a JSON value of type {!subscription_command}. *)

val string_of_subscription_command :
  ?len:int -> subscription_command -> string
  (** Serialize a value of type {!subscription_command}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_subscription_command :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> subscription_command
  (** Input JSON data of type {!subscription_command}. *)

val subscription_command_of_string :
  string -> subscription_command
  (** Deserialize JSON data of type {!subscription_command}. *)


val write_stream :
  Bi_outbuf.t -> stream -> unit
  (** Output a JSON value of type {!stream}. *)

val string_of_stream :
  ?len:int -> stream -> string
  (** Serialize a value of type {!stream}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_stream :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> stream
  (** Input JSON data of type {!stream}. *)

val stream_of_string :
  string -> stream
  (** Deserialize JSON data of type {!stream}. *)


val write_account :
  Bi_outbuf.t -> account -> unit
  (** Output a JSON value of type {!account}. *)

val string_of_account :
  ?len:int -> account -> string
  (** Serialize a value of type {!account}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_account :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> account
  (** Input JSON data of type {!account}. *)

val account_of_string :
  string -> account
  (** Deserialize JSON data of type {!account}. *)


val write_subscription_request :
  Bi_outbuf.t -> subscription_request -> unit
  (** Output a JSON value of type {!subscription_request}. *)

val string_of_subscription_request :
  ?len:int -> subscription_request -> string
  (** Serialize a value of type {!subscription_request}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_subscription_request :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> subscription_request
  (** Input JSON data of type {!subscription_request}. *)

val subscription_request_of_string :
  string -> subscription_request
  (** Deserialize JSON data of type {!subscription_request}. *)

val create_subscription_request :
  subscription_request_id: int64 ->
  subscription_request_command: subscription_command ->
  subscription_request_accounts: account list ->
  subscription_request_streams: stream list ->
  unit -> subscription_request
  (** Create a record of type {!subscription_request}. *)


val write_ledger_command :
  Bi_outbuf.t -> ledger_command -> unit
  (** Output a JSON value of type {!ledger_command}. *)

val string_of_ledger_command :
  ?len:int -> ledger_command -> string
  (** Serialize a value of type {!ledger_command}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_ledger_command :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> ledger_command
  (** Input JSON data of type {!ledger_command}. *)

val ledger_command_of_string :
  string -> ledger_command
  (** Deserialize JSON data of type {!ledger_command}. *)


val write_ledger_request :
  Bi_outbuf.t -> ledger_request -> unit
  (** Output a JSON value of type {!ledger_request}. *)

val string_of_ledger_request :
  ?len:int -> ledger_request -> string
  (** Serialize a value of type {!ledger_request}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_ledger_request :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> ledger_request
  (** Input JSON data of type {!ledger_request}. *)

val ledger_request_of_string :
  string -> ledger_request
  (** Deserialize JSON data of type {!ledger_request}. *)

val create_ledger_request :
  ledger_request_id: int64 ->
  ledger_request_command: ledger_command ->
  ledger_request_full: bool ->
  ledger_request_expand: bool ->
  ledger_request_transactions: bool ->
  ledger_request_accounts: bool ->
  unit -> ledger_request
  (** Create a record of type {!ledger_request}. *)


val write_status :
  Bi_outbuf.t -> status -> unit
  (** Output a JSON value of type {!status}. *)

val string_of_status :
  ?len:int -> status -> string
  (** Serialize a value of type {!status}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_status :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> status
  (** Input JSON data of type {!status}. *)

val status_of_string :
  string -> status
  (** Deserialize JSON data of type {!status}. *)


val write_type_ :
  Bi_outbuf.t -> type_ -> unit
  (** Output a JSON value of type {!type_}. *)

val string_of_type_ :
  ?len:int -> type_ -> string
  (** Serialize a value of type {!type_}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_type_ :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> type_
  (** Input JSON data of type {!type_}. *)

val type__of_string :
  string -> type_
  (** Deserialize JSON data of type {!type_}. *)


val write_result :
  Bi_outbuf.t -> result -> unit
  (** Output a JSON value of type {!result}. *)

val string_of_result :
  ?len:int -> result -> string
  (** Serialize a value of type {!result}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_result :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> result
  (** Input JSON data of type {!result}. *)

val result_of_string :
  string -> result
  (** Deserialize JSON data of type {!result}. *)

val create_result :
  ?result_info: info ->
  ?result_state: state ->
  ?result_fee_base: int ->
  ?result_fee_ref: int ->
  ?result_ledger_hash: string ->
  ?result_ledger_index: int64 ->
  ?result_ledger_time: int64 ->
  ?result_load_base: int ->
  ?result_load_factor: load_factor ->
  ?result_random: string ->
  ?result_reserve_base: int64 ->
  ?result_reserve_inc: int64 ->
  ?result_server_status: server_state ->
  ?result_validated_ledgers: string ->
  unit -> result
  (** Create a record of type {!result}. *)


val write_response :
  Bi_outbuf.t -> response -> unit
  (** Output a JSON value of type {!response}. *)

val string_of_response :
  ?len:int -> response -> string
  (** Serialize a value of type {!response}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_response :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> response
  (** Input JSON data of type {!response}. *)

val response_of_string :
  string -> response
  (** Deserialize JSON data of type {!response}. *)

val create_response :
  response_id: int64 ->
  response_status: status ->
  response_type_: type_ ->
  response_result: result ->
  unit -> response
  (** Create a record of type {!response}. *)


