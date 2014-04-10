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

