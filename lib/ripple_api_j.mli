(* Auto-generated from "ripple_api.atd" *)


type int64 = Ripple_api_t.int64

type positive = Ripple_api_t.positive

type error = Ripple_api_t.error

type command = Ripple_api_t.command

type request = Ripple_api_t.request = {
  request_command (*atd command *): command
}

type response_status = Ripple_api_t.response_status

type response = Ripple_api_t.response = {
  response_id (*atd id *): int64;
  response_status (*atd status *): response_status;
  response_error (*atd error *): error option;
  response_error_message (*atd error_message *): string option;
  response_request (*atd request *): request option
}

type dyn = Yojson.Safe.json

type final_fields = Ripple_api_t.final_fields = {
  final_fields_account (*atd account *): string;
  final_fields_book_directory (*atd book_directory *): string;
  final_fields_book_node (*atd book_node *): string;
  final_fields_flags (*atd flags *): int;
  final_fields_owner_node (*atd owner_node *): string;
  final_fields_previous_txn_id (*atd previous_txn_id *): string;
  final_fields_previous_txn_lgr_seq (*atd previous_txn_lgr_seq *): int;
  final_fields_sequence (*atd sequence *): int;
  final_fields_taker_gets (*atd taker_gets *): dyn;
  final_fields_taker_pays (*atd taker_pays *): dyn;
  final_fields_ledger_entry_type (*atd ledger_entry_type *): string;
  final_fields_ledger_index (*atd ledger_index *): string
}

type node = Ripple_api_t.node = {
  node_final_fields (*atd final_fields *): final_fields
}

type affected_node = Ripple_api_t.affected_node = {
  affected_node_modified_node (*atd modified_node *): node option;
  affected_node_deleted_node (*atd deleted_node *): node option
}

type tx_meta = Ripple_api_t.tx_meta = {
  tx_meta_affected_nodes (*atd affected_nodes *): affected_node list;
  tx_meta_transaction_index (*atd transaction_index *): int;
  tx_meta_transactionResult (*atd transactionResult *): string
}

type tx_data = Ripple_api_t.tx_data = {
  tx_account (*atd account *): string;
  tx_amount (*atd amount *): string;
  tx_destination (*atd destination *): string;
  tx_fee (*atd fee *): string;
  tx_flags (*atd flags *): int;
  tx_invoice_id (*atd invoice_id *): string;
  tx_sequence (*atd sequence *): int;
  tx_signing_pub_key (*atd signing_pub_key *): string
}

type transaction = Ripple_api_t.transaction = {
  tx_msg_engine_result (*atd engine_result *): string;
  tx_msg_engine_result_code (*atd engine_result_code *): int;
  tx_msg_engine_result_message (*atd engine_result_message *): string;
  tx_msg_ledger_hash (*atd ledger_hash *): string;
  tx_msg_ledger_index (*atd ledger_index *): int;
  tx_msg_meta (*atd meta *): tx_meta;
  tx_msg_status (*atd status *): string;
  tx_msg_transaction (*atd transaction *): tx_data;
  tx_msg_ty (*atd ty *): string;
  tx_msg_validated (*atd validated *): bool
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

val write_error :
  Bi_outbuf.t -> error -> unit
  (** Output a JSON value of type {!error}. *)

val string_of_error :
  ?len:int -> error -> string
  (** Serialize a value of type {!error}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_error :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> error
  (** Input JSON data of type {!error}. *)

val error_of_string :
  string -> error
  (** Deserialize JSON data of type {!error}. *)

val write_command :
  Bi_outbuf.t -> command -> unit
  (** Output a JSON value of type {!command}. *)

val string_of_command :
  ?len:int -> command -> string
  (** Serialize a value of type {!command}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_command :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> command
  (** Input JSON data of type {!command}. *)

val command_of_string :
  string -> command
  (** Deserialize JSON data of type {!command}. *)

val write_request :
  Bi_outbuf.t -> request -> unit
  (** Output a JSON value of type {!request}. *)

val string_of_request :
  ?len:int -> request -> string
  (** Serialize a value of type {!request}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_request :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> request
  (** Input JSON data of type {!request}. *)

val request_of_string :
  string -> request
  (** Deserialize JSON data of type {!request}. *)

val write_response_status :
  Bi_outbuf.t -> response_status -> unit
  (** Output a JSON value of type {!response_status}. *)

val string_of_response_status :
  ?len:int -> response_status -> string
  (** Serialize a value of type {!response_status}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_response_status :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> response_status
  (** Input JSON data of type {!response_status}. *)

val response_status_of_string :
  string -> response_status
  (** Deserialize JSON data of type {!response_status}. *)

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

val write_dyn :
  Bi_outbuf.t -> dyn -> unit
  (** Output a JSON value of type {!dyn}. *)

val string_of_dyn :
  ?len:int -> dyn -> string
  (** Serialize a value of type {!dyn}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_dyn :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> dyn
  (** Input JSON data of type {!dyn}. *)

val dyn_of_string :
  string -> dyn
  (** Deserialize JSON data of type {!dyn}. *)

val write_final_fields :
  Bi_outbuf.t -> final_fields -> unit
  (** Output a JSON value of type {!final_fields}. *)

val string_of_final_fields :
  ?len:int -> final_fields -> string
  (** Serialize a value of type {!final_fields}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_final_fields :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> final_fields
  (** Input JSON data of type {!final_fields}. *)

val final_fields_of_string :
  string -> final_fields
  (** Deserialize JSON data of type {!final_fields}. *)

val write_node :
  Bi_outbuf.t -> node -> unit
  (** Output a JSON value of type {!node}. *)

val string_of_node :
  ?len:int -> node -> string
  (** Serialize a value of type {!node}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_node :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> node
  (** Input JSON data of type {!node}. *)

val node_of_string :
  string -> node
  (** Deserialize JSON data of type {!node}. *)

val write_affected_node :
  Bi_outbuf.t -> affected_node -> unit
  (** Output a JSON value of type {!affected_node}. *)

val string_of_affected_node :
  ?len:int -> affected_node -> string
  (** Serialize a value of type {!affected_node}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_affected_node :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> affected_node
  (** Input JSON data of type {!affected_node}. *)

val affected_node_of_string :
  string -> affected_node
  (** Deserialize JSON data of type {!affected_node}. *)

val write_tx_meta :
  Bi_outbuf.t -> tx_meta -> unit
  (** Output a JSON value of type {!tx_meta}. *)

val string_of_tx_meta :
  ?len:int -> tx_meta -> string
  (** Serialize a value of type {!tx_meta}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_tx_meta :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> tx_meta
  (** Input JSON data of type {!tx_meta}. *)

val tx_meta_of_string :
  string -> tx_meta
  (** Deserialize JSON data of type {!tx_meta}. *)

val write_tx_data :
  Bi_outbuf.t -> tx_data -> unit
  (** Output a JSON value of type {!tx_data}. *)

val string_of_tx_data :
  ?len:int -> tx_data -> string
  (** Serialize a value of type {!tx_data}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_tx_data :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> tx_data
  (** Input JSON data of type {!tx_data}. *)

val tx_data_of_string :
  string -> tx_data
  (** Deserialize JSON data of type {!tx_data}. *)

val write_transaction :
  Bi_outbuf.t -> transaction -> unit
  (** Output a JSON value of type {!transaction}. *)

val string_of_transaction :
  ?len:int -> transaction -> string
  (** Serialize a value of type {!transaction}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_transaction :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> transaction
  (** Input JSON data of type {!transaction}. *)

val transaction_of_string :
  string -> transaction
  (** Deserialize JSON data of type {!transaction}. *)

