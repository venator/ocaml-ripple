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

type dyn = Yojson.Safe.json

type final_fields = {
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

type node = { node_final_fields (*atd final_fields *): final_fields }

type affected_node = {
  affected_node_modified_node (*atd modified_node *): node option;
  affected_node_deleted_node (*atd deleted_node *): node option
}

type tx_meta = {
  tx_meta_affected_nodes (*atd affected_nodes *): affected_node list;
  tx_meta_transaction_index (*atd transaction_index *): int;
  tx_meta_transactionResult (*atd transactionResult *): string
}

type tx_data = {
  tx_account (*atd account *): string;
  tx_amount (*atd amount *): string;
  tx_destination (*atd destination *): string;
  tx_fee (*atd fee *): string;
  tx_flags (*atd flags *): int;
  tx_invoice_id (*atd invoice_id *): string;
  tx_sequence (*atd sequence *): int;
  tx_signing_pub_key (*atd signing_pub_key *): string
}

type transaction = {
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
