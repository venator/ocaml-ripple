open Lwt
open Ripple
open Ripple_api_j
open Transaction

let main () =
  with_transactions (Uri.of_string "wss://s-east.ripple.com") >>= fun trs ->
  Lwt_stream.iter (fun t ->
      (* let t = Yojson.Safe.prettify ~std:true t in *)
      (* Printf.printf "%s\n\n%!" t; *)
      try
        let t = transaction_of_string t in
        if t.tx_msg_validated && t.tx_msg_engine_result_code = 0 &&
           List.mem t.tx_msg_transaction.tx_transaction_type ["Payment"; "OfferCreate"; "OfferCancel"] &&
           is_trade t
        then
          Printf.printf "%s\n\n%!" (Yojson.Safe.prettify ~std:true (string_of_transaction t))
      with exn ->
        let t = Yojson.Safe.prettify ~std:true t in
        Printf.printf "%s\n\n%!" t;
        raise exn
    ) trs

let () = Lwt_main.run (main ())
