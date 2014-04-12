(* High level transaction types *)

module R = Ripple_api_t

type node_op =
  | Created
  | Modified
  | Deleted

type node =
  { op: node_op;
    node_content: R.node
  }

let nodes_of_tx t =
  let open R in
  let affected_nodes = t.tx_msg_meta.tx_meta_affected_nodes in
  List.map
    (function
      | { created_node=(Some n); modified_node=None; deleted_node=None } -> { op=Created; node_content=n }
      | { created_node=None; modified_node=(Some n); deleted_node=None } -> { op=Modified; node_content=n }
      | { created_node=None; modified_node=None; deleted_node=(Some n) } -> { op=Deleted; node_content=n }
      | _ -> raise (Invalid_argument "is_trade")
    ) affected_nodes

let offer_nodes_of_tx t =
  let open R in
  let nodes = nodes_of_tx t in
  List.filter (fun {op; node_content} -> node_content.node_ledger_entry_type = "Offer") nodes

let is_trade t =
  let open R in
  let nodes = nodes_of_tx t in
  let nodes = List.map (fun {op; node_content} -> node_content) nodes in
  List.exists (fun n -> n.node_ledger_entry_type = "Offer") nodes
