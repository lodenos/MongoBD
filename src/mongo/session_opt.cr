  # fun session_opts_new = mongoc_session_opts_new : SessionOpt*
  # fun session_opts_get_causal_consistency = mongoc_session_opts_get_causal_consistency(opts : SessionOpt*) : Bool
  # fun session_opts_set_causal_consistency = mongoc_session_opts_set_causal_consistency(opts : SessionOpt*, causal_consistency : Bool) : Void
  # fun session_opts_get_default_transaction_opts = mongoc_session_opts_get_default_transaction_opts(opts : SessionOpt*) : TransactionOpt*
  # fun session_opts_set_default_transaction_opts = mongoc_session_opts_set_default_transaction_opts(opts : SessionOpt*, txn_opts : TransactionOpt*) : Void
  # fun session_opts_get_transaction_opts = mongoc_session_opts_get_transaction_opts(session : ClientSession*) : TransactionOpt*
  # fun session_opts_clone = mongoc_session_opts_clone(opts : SessionOpt*) : SessionOpt*
  # fun session_opts_destroy = mongoc_session_opts_destroy(opts : SessionOpt*) : Void