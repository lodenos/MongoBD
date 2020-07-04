@[Link(ldflags: "-lmongoc-1.0")]
lib LibMongoc
  type BSON = Void
  type BSON_error = Void
  type BSON_value = Void

  type SizeT = UInt64
  type SSizeT = Int64

  ### Initialization and Cleanup
  fun init = mongoc_init : Void
  fun cleanup = mongoc_cleanup : Void

  ### Logging
  # http://mongoc.org/libmongoc/1.16.2/logging.html

  ### Error Reporting
  # http://mongoc.org/libmongoc/1.16.2/errors.html

  ### Object Lifecycle
  # http://mongoc.org/libmongoc/1.16.2/lifecycle.html

  ### GridFS
  # http://mongoc.org/libmongoc/1.16.2/gridfs.html

  ### mongoc_auto_encryption_opts_t
  # typedef struct _mongoc_auto_encryption_opts_t mongoc_auto_encryption_opts_t
  type AutoEncryptionOpts = Void

  fun auto_encryption_opts_new = mongoc_auto_encryption_opts_new : AutoEncryptionOpts*
  fun auto_encryption_opts_destroy = mongoc_auto_encryption_opts_destroy(opts : AutoEncryptionOpts*) : Void
  fun auto_encryption_opts_set_keyvault_client = mongoc_auto_encryption_opts_set_keyvault_client(opts : AutoEncryptionOpts*, client : Client*) : Void
  fun auto_encryption_opts_set_keyvault_client_pool = mongoc_auto_encryption_opts_set_keyvault_client_pool(opts : AutoEncryptionOpts*, pool : ClientPool*) : Void
  fun auto_encryption_opts_set_keyvault_namespace = mongoc_auto_encryption_opts_set_keyvault_namespace(opts : AutoEncryptionOpts*, db : Int8*, coll : Int8*) : Void
  fun auto_encryption_opts_set_kms_providers = mongoc_auto_encryption_opts_set_kms_providers(opts : AutoEncryptionOpts*, kms_providers : BSON*) : Void
  fun auto_encryption_opts_set_schema_map = mongoc_auto_encryption_opts_set_schema_map(opts : AutoEncryptionOpts*, schema_map : BSON*) : Void
  fun auto_encryption_opts_set_bypass_auto_encryption = mongoc_auto_encryption_opts_set_bypass_auto_encryption(opts : AutoEncryptionOpts*, bypass_auto_encryption : Bool) : Void
  fun auto_encryption_opts_set_extra = mongoc_auto_encryption_opts_set_extra(opts : AutoEncryptionOpts*, extra : BSON*) : Void

  ### mongoc_bulk_operation_t
  # typedef struct _mongoc_bulk_operation_t mongoc_bulk_operation_t
  type BulkOperation = Void

  fun bulk_operation_delete = mongoc_bulk_operation_delete(bulk : BulkOperation*, selector : BSON*) : Void
  fun bulk_operation_delete_one = mongoc_bulk_operation_delete_one(bulk : BulkOperation*, selector : BSON*) : Void
  fun bulk_operation_destroy = mongoc_bulk_operation_destroy(bulk : BulkOperation*) : Void
  fun bulk_operation_execute = mongoc_bulk_operation_execute(bulk : BulkOperation*, reply : BSON*, error : BSON_error*) : UInt32
  fun bulk_operation_get_hint = mongoc_bulk_operation_get_hint(bulk : BulkOperation*) : UInt32
  fun bulk_operation_get_write_concern = mongoc_bulk_operation_get_write_concern(bulk : BulkOperation*) : WriteConcern*
  fun bulk_operation_insert = mongoc_bulk_operation_insert(bulk : BulkOperation*, document : BSON*) : Void
  fun bulk_operation_insert_with_opts = mongoc_bulk_operation_insert_with_opts(bulk : BulkOperation*, document : BSON*, opts : BSON*, error : BSON_error*) : Bool
  fun bulk_operation_remove = mongoc_bulk_operation_remove(bulk : BulkOperation*, selector : BSON*) : Void
  fun bulk_operation_remove_many_with_opts = mongoc_bulk_operation_remove_many_with_opts(bulk : BulkOperation*, selector : BSON*, opts : BSON*, error : BSON_error*) : Bool
  fun bulk_operation_remove_one = mongoc_bulk_operation_remove_one(bulk : BulkOperation*, selector : BSON*) : Void
  fun bulk_operation_remove_one_with_opts = mongoc_bulk_operation_remove_one_with_opts(bulk : BulkOperation*, selector : BSON*, opts : BSON*, error : BSON_error*) : Bool
  fun bulk_operation_replace_one = mongoc_bulk_operation_replace_one(bulk : BulkOperation*, selector : BSON*, document : BSON*, upsert : Bool) : Void
  fun bulk_operation_replace_one_with_opts = mongoc_bulk_operation_replace_one_with_opts(bulk : BulkOperation*, selector : BSON*, document : BSON*, opts : BSON*, error : BSON_error*) : Bool
  fun bulk_operation_set_bypass_document_validation = mongoc_bulk_operation_set_bypass_document_validation(bulk : BulkOperation*, bypass : Bool) : Void
  fun bulk_operation_set_client_session = mongoc_bulk_operation_set_client_session(bulk : BulkOperation*, client_session : ClientSession*) : Void
  fun bulk_operation_set_hint = mongoc_bulk_operation_set_hint(bulk : BulkOperation*, server_id : UInt32) : Void
  fun bulk_operation_update = mongoc_bulk_operation_update(bulk : BulkOperation*, selector : BSON*, document : BSON*, upsert : Bool) : Void
  fun bulk_operation_update_many_with_opts = mongoc_bulk_operation_update_many_with_opts(bulk : BulkOperation*, selector : BSON*, document : BSON*, opts : BSON*, error : BSON_error*) : Bool
  fun bulk_operation_update_one = mongoc_bulk_operation_update_one(bulk : BulkOperation*, selector : BSON*, document : BSON*, upsert : Bool) : Void
  fun bulk_operation_update_one_with_opts = mongoc_bulk_operation_update_one_with_opts(bulk : BulkOperation*, selector : BSON*, document : BSON*, opts : BSON*, error : BSON_error*) : Bool

  ### mongoc_change_stream_t
  # typedef struct _mongoc_change_stream_t mongoc_change_stream_t
  type ChangeStream = Void

  fun client_watch = mongoc_client_watch(client : Client*, pipeline : BSON*, opts : BSON*) : ChangeStream*
  fun database_watch = mongoc_database_watch(db : Database*, pipeline : BSON*, opts : BSON*) : ChangeStream*
  fun collection_watch = mongoc_collection_watch(coll : Collection*, pipeline : BSON*, opts : BSON*) : ChangeStream*
  fun change_stream_next = mongoc_change_stream_next(stream : ChangeStream*, bson : BSON**) : Bool
  fun change_stream_get_resume_token = mongoc_change_stream_get_resume_token(stream : ChangeStream*) : BSON*
  fun change_stream_error_document = mongoc_change_stream_error_document(stream : ChangeStream*, err : BSON_error*, reply : BSON**) : Bool
  fun change_stream_destroy = mongoc_change_stream_destroy(stream : ChangeStream*) : Void

  ### mongoc_client_encryption_t
  # typedef struct _mongoc_client_encryption_t mongoc_client_encryption_t
  type ClientEncryption = Void

  fun client_encryption_new = mongoc_client_encryption_new(opts : ClientEncryptionOpts*, error : BSON_error*) : ClientEncryption*
  fun client_encryption_destroy = mongoc_client_encryption_destroy(client_encryption : ClientEncryption*) : Void
  fun client_encryption_create_datakey = mongoc_client_encryption_create_datakey(client_encryption : ClientEncryption*, kms_provider : Int8*, opts : ClientEncryptionDatakeyOpts*, keyid : BSON_value*, error : BSON_error*) : Bool
  fun client_encryption_encrypt = mongoc_client_encryption_encrypt(client_encryption : ClientEncryption*, value : BSON_value*, opts : ClientEncryptionEncryptOpts*, ciphertext : BSON_value*, error : BSON_error*) : Bool
  fun client_encryption_decrypt = mongoc_client_encryption_decrypt(client_encryption : ClientEncryption*, ciphertext : BSON_value*, value : BSON_value*, error : BSON_error*) : Bool

  ### mongoc_client_encryption_datakey_opts_t
  # typedef struct _mongoc_client_encryption_datakey_opts_t mongoc_client_encryption_datakey_opts_t;
  type ClientEncryptionDatakeyOpts = Void

  fun client_encryption_datakey_opts_new = mongoc_client_encryption_datakey_opts_new : ClientEncryptionDatakeyOpts* 
  fun client_encryption_datakey_opts_destroy = mongoc_client_encryption_datakey_opts_destroy(opts : ClientEncryptionDatakeyOpts*) : Void
  fun client_encryption_datakey_opts_set_masterkey = mongoc_client_encryption_datakey_opts_set_masterkey(opts : ClientEncryptionDatakeyOpts*, masterkey : BSON*) : Void
  fun client_encryption_datakey_opts_set_keyaltnames = mongoc_client_encryption_datakey_opts_set_keyaltnames(opts : ClientEncryptionDatakeyOpts*, keyaltnames : Int8**, keyaltnames_count : UInt32) : Void

  ### mongoc_client_encryption_encrypt_opts_t
  # typedef struct _mongoc_client_encryption_encrypt_opts_t mongoc_client_encryption_encrypt_opts_t
  type ClientEncryptionEncryptOpts = Void

  fun client_encryption_encrypt_opts_new = mongoc_client_encryption_encrypt_opts_new : ClientEncryptionEncryptOpts*
  fun client_encryption_encrypt_opts_destroy = mongoc_client_encryption_encrypt_opts_destroy(opts : ClientEncryptionEncryptOpts*) : Void
  fun client_encryption_encrypt_opts_set_keyid = mongoc_client_encryption_encrypt_opts_set_keyid(opts : ClientEncryptionEncryptOpts*, keyid : BSON_value*) : Void
  fun client_encryption_encrypt_opts_set_keyaltname = mongoc_client_encryption_encrypt_opts_set_keyaltname(opts : ClientEncryptionEncryptOpts*, keyaltname : Int8*) : Void
  fun client_encryption_encrypt_opts_set_algorithm = mongoc_client_encryption_encrypt_opts_set_algorithm(opts : ClientEncryptionEncryptOpts*, algorithm : Int8*) : Void
  #define MONGOC_AEAD_AES_256_CBC_HMAC_SHA_512_RANDOM "AEAD_AES_256_CBC_HMAC_SHA_512-Random"
  #define MONGOC_AEAD_AES_256_CBC_HMAC_SHA_512_DETERMINISTIC "AEAD_AES_256_CBC_HMAC_SHA_512-Deterministic"

  ### mongoc_client_encryption_opts_t
  # typedef struct _mongoc_client_encryption_opts_t mongoc_client_encryption_opts_t
  type ClientEncryptionOpts = Void

  fun client_encryption_opts_new = mongoc_client_encryption_opts_new : ClientEncryptionOpts*
  fun client_encryption_opts_destroy = mongoc_client_encryption_opts_destroy(opts : ClientEncryptionOpts*) : Void
  fun client_encryption_opts_set_keyvault_client = mongoc_client_encryption_opts_set_keyvault_client(opts : ClientEncryptionOpts*, keyvault_client : Client*) : Void
  fun client_encryption_opts_set_keyvault_namespace = mongoc_client_encryption_opts_set_keyvault_namespace(opts : ClientEncryptionOpts*, db : Int8*, coll : Int8*) : Void
  fun client_encryption_opts_set_kms_providers = mongoc_client_encryption_opts_set_kms_providers(opts : ClientEncryptionOpts*, kms_providers : BSON*) : Void

  ### mongoc_client_pool_t
  # typedef struct _mongoc_client_pool_t mongoc_client_pool_t
  type ClientPool = Void

  fun client_pool_destroy = mongoc_client_pool_destroy(pool : ClientPool*) : Void
  fun client_pool_enable_auto_encryption = mongoc_client_pool_enable_auto_encryption(pool : ClientPool*, opts : AutoEncryptionOpts*, error : BSON_error*) : Bool
  fun client_pool_max_size = mongoc_client_pool_max_size(pool : ClientPool*, max_pool_size : UInt32) : Void
  fun client_pool_min_size = mongoc_client_pool_min_size(pool : ClientPool*, min_pool_size : UInt32) : Void # BSON_GNUC_DEPRECATED
  fun client_pool_new = mongoc_client_pool_new(uri : Uri*) : ClientPool*
  fun client_pool_pop = mongoc_client_pool_pop(pool : ClientPool*) : Client*
  fun client_pool_push = mongoc_client_pool_push(pool : ClientPool*, client : Client*) : Void
  fun client_pool_set_apm_callbacks = mongoc_client_pool_set_apm_callbacks(pool : ClientPool*, callbacks : ApmCallbacks*, context : Void*) : Bool
  fun client_pool_set_appname = mongoc_client_pool_set_appname(pool : ClientPool*, appname : Int8*) : Bool
  fun client_pool_set_error_api = mongoc_client_pool_set_error_api(client : ClientPool*, version : Int32) : Bool
  #ifdef MONGOC_ENABLE_SSL
  # void mongoc_client_pool_set_ssl_opts(mongoc_client_pool_t *pool, const mongoc_ssl_opt_t *opts)
  #endif
  fun client_pool_try_pop = mongoc_client_pool_try_pop(pool : ClientPool*) : Client*

  ### mongoc_client_session_t
  type ClientSession = Void

  fun client_session_start_transaction = mongoc_client_session_start_transaction(session : ClientSession*, opts : TransactionOpt*, error : BSON_error*) : Bool
  fun client_session_in_transaction = mongoc_client_session_in_transaction(session : ClientSession*) : Bool
  fun client_session_get_transaction_state = mongoc_client_session_get_transaction_state(session : ClientSession*) : TransactionState
  fun client_session_commit_transaction = mongoc_client_session_commit_transaction(session : ClientSession*, reply : BSON*, error : BSON_error*) : Bool
  fun client_session_abort_transaction = mongoc_client_session_abort_transaction(session : ClientSession*, error : BSON_error*) : Bool
  fun client_session_advance_cluster_time = mongoc_client_session_advance_cluster_time(session : ClientSession*, cluster_time : BSON*) : Void
  fun client_session_advance_operation_time = mongoc_client_session_advance_operation_time(session : ClientSession*, timestamp : UInt32, increment : UInt32) : Void
  # fun client_session_with_transaction = mongoc_client_session_with_transaction(session : ClientSession*, cb : ClientSessionWithTransactionCb, opts : TransactionOpt*, ctx : Void*, reply : BSON*, error : BSON_error*) : Bool
  fun client_session_append = mongoc_client_session_append(client_session : ClientSession*, opts : BSON*, error : BSON_error*) : Bool
  fun client_session_get_client = mongoc_client_session_get_client(session : ClientSession*) : Client*
  fun client_session_get_cluster_time = mongoc_client_session_get_cluster_time(session : ClientSession*) : BSON*
  fun client_session_get_operation_time = mongoc_client_session_get_operation_time(session : ClientSession*, timestamp : UInt32*, increment : UInt32*) : Void
  fun client_session_get_opts = mongoc_client_session_get_opts(session : ClientSession*) : SessionOpt*
  fun client_session_get_lsid = mongoc_client_session_get_lsid(session : ClientSession*) : BSON*
  fun client_session_get_server_id = mongoc_client_session_get_server_id(session : ClientSession*) : UInt32
  fun client_session_destroy = mongoc_client_session_destroy(session : ClientSession*) : Void

  ### mongoc_client_session_with_transaction_cb_t
  # @ Typedef
  # typedef bool (*mongoc_client_session_with_transaction_cb_t)(mongoc_client_session_t *session, void *ctx, bson_t **reply, bson_error_t *error)

  # fun client_session_with_transaction = mongoc_client_session_with_transaction(session : ClientSession*, cb : ClientSessionWithTransactionCb, opts : TransactionOpt*, ctx : Void*, reply : BSON*, error : BSON_error*) : Bool
 
  ### mongoc_client_t
  # typedef struct _mongoc_client_t mongoc_client_t;
  type Client = Void
  type ApmCallbacks = Void
  # typedef mongoc_stream_t *(*mongoc_stream_initiator_t)(const mongoc_uri_t *uri, const mongoc_host_list_t *host, void *user_data, bson_error_t *error)

  fun client_command = mongoc_client_command(client : Client*, db_name : Int8*, flags : QueryFlags, skip : UInt32, limit : UInt32, batch_size : UInt32, query : BSON*, fields : BSON*, read_prefs : ReadPrefs*) : Cursor*
  fun client_command_simple = mongoc_client_command_simple(client : Client*, db_name : Int8*, command : BSON*, read_prefs : ReadPrefs*, reply : BSON*, error : BSON_error*) : Bool
  fun client_command_simple_with_server_id = mongoc_client_command_simple_with_server_id(client : Client*, db_name : Int8*, command : BSON*, read_prefs : ReadPrefs*, server_id : UInt32, reply : BSON*, error : BSON_error*) : Bool
  fun client_command_with_opts = mongoc_client_command_with_opts(client : Client*, db_name : Int8*, command : BSON*, read_prefs : ReadPrefs*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
  fun client_destroy = mongoc_client_destroy(client : Client*) : Void
  fun client_enable_auto_encryption = mongoc_client_enable_auto_encryption(client : Client*, opts : AutoEncryptionOpts* , error : BSON_error*) : Bool
  fun client_find_databases_with_opts = mongoc_client_find_databases_with_opts(client : Client*, opts : BSON*) : Cursor*
  fun client_get_collection = mongoc_client_get_collection(client : Client*, db : UInt8*, collection : Int8*) : Collection*
  fun client_get_database = mongoc_client_get_database(client : Client*, name : UInt8*) : Database*
  fun client_get_database_names = mongoc_client_get_database_names(client : Client*, error : BSON_error*) : Int8**
  fun client_get_database_names_with_opts = mongoc_client_get_database_names_with_opts(client : Client*, opts : BSON*, error : BSON_error*) : Int8**
  fun client_get_default_database = mongoc_client_get_default_database(client : Client*) : Database*
  fun client_get_gridfs = mongoc_client_get_gridfs(client : Client*, db : Int8*, prefix : Int8*, error : BSON_error*) : Gridfs*
  fun client_get_max_bson_size = mongoc_client_get_max_bson_size(client : Client*) : Int32
  fun client_get_max_message_size = mongoc_client_get_max_message_size(client : Client*) : Int32
  fun client_get_read_concern = mongoc_client_get_read_concern(client : Client*) : ReadConcern*
  fun client_get_read_prefs = mongoc_client_get_read_prefs(client : Client*) : ReadPrefs*
  fun client_get_server_description = mongoc_client_get_server_description(client : Client*, server_id : UInt32) : ServerDescription*
  fun client_get_server_descriptions = mongoc_client_get_server_descriptions(client : Client*, n : SizeT*) : ServerDescription**
  fun client_get_server_status = mongoc_client_get_server_status(client : Client*, read_prefs : ReadPrefs*, reply : BSON*, error : BSON_error*) : Bool # BSON_GNUC_DEPRECATED
  fun client_get_uri = mongoc_client_get_uri(client : Client*) : Uri*
  fun client_get_write_concern = mongoc_client_get_write_concern(client : Client*) : WriteConcern*
  fun client_new = mongoc_client_new(uri_string : UInt8*) : Client*
  fun client_new_from_uri = mongoc_client_new_from_uri(uri : Uri*) : Client*
  fun client_read_command_with_opts = mongoc_client_read_command_with_opts(client : Client*, db_name : Int8*, command : BSON*, read_prefs : ReadPrefs*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
  fun client_read_write_command_with_opts = mongoc_client_read_write_command_with_opts(client : Client*, db_name : Int8*, command : BSON*, read_prefs : ReadPrefs*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
  fun client_reset = mongoc_client_reset(client : Client*) : Void
  fun client_select_server = mongoc_client_select_server(client : Client*, for_writes : Bool, prefs : ReadPrefs*, error : BSON_error*) : ServerDescription*
  fun client_set_apm_callbacks = mongoc_client_set_apm_callbacks(client : Client*, callbacks : ApmCallbacks*, context : Void*) : Bool
  fun client_set_appname = mongoc_client_set_appname(client : Client*, appname : Int8*) : Bool
  fun client_set_error_api = mongoc_client_set_error_api(client : Client*, version : Int32) : Bool
  fun client_set_read_concern = mongoc_client_set_read_concern(client : Client*, read_concern : ReadConcern*) : Void
  fun client_set_read_prefs = mongoc_client_set_read_prefs(client : Client*, read_prefs : ReadPrefs*) : Void
  # #ifdef MONGOC_ENABLE_SSL
  # void mongoc_client_set_ssl_opts(mongoc_client_t *client, const mongoc_ssl_opt_t *opts)
  #endif
  # fun client_set_stream_initiator = mongoc_client_set_stream_initiator(client : Client*, initiator : StreamInitiator, user_data : Void*) : Void
  fun client_set_write_concern = mongoc_client_set_write_concern(client : Client*, write_concern : WriteConcern*) : Void
  fun client_start_session = mongoc_client_start_session(client : Client*, opts : SessionOpt*, error : BSON_error*) : ClientSession*
  fun client_watch = mongoc_client_watch(client : Client*, pipeline : BSON*, opts : BSON*) : ChangeStream*
  fun client_write_command_with_opts = mongoc_client_write_command_with_opts(client : Client*, db_name : Int8*, command : BSON*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool

  ### mongoc_collection_t
  # typedef struct _mongoc_collection_t mongoc_collection_t;
  type Collection = Void

  fun collection_aggregate = mongoc_collection_aggregate(collection : Collection*, flags : QueryFlags, pipeline : BSON*, opts : BSON*, read_prefs : ReadPrefs*) : Cursor* # BSON_GNUC_WARN_UNUSED_RESULT
  fun collection_command = mongoc_collection_command(collection : Collection*, flags : QueryFlags, skip : UInt32, limit : UInt32, batch_size : UInt32, command : BSON*, fields : BSON*, read_prefs : ReadPrefs*) : Cursor* # BSON_GNUC_WARN_UNUSED_RESULT
  fun collection_command_simple = mongoc_collection_command_simple(collection : Collection*, command : BSON*, read_prefs : ReadPrefs*, reply : BSON*, error : BSON_error*) : Bool
  fun collection_command_with_opts = mongoc_collection_command_with_opts(collection : Collection*, command : BSON*, read_prefs : ReadPrefs*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
  fun collection_copy = mongoc_collection_copy(collection : Collection*) : Collection*
  fun collection_count_documents = mongoc_collection_count_documents(collection : Collection*, filter : BSON*, opts : BSON*, read_prefs : ReadPrefs*, reply : BSON*, error : BSON_error*) : Int64
  fun collection_estimated_document_count = mongoc_collection_estimated_document_count(collection : Collection*, opts : BSON*, read_prefs : ReadPrefs*, reply : BSON*, error : BSON_error*) : Int64
  fun collection_count = mongoc_collection_count(collection : Collection*, flags : QueryFlags, query : BSON*, skip : Int64, limit : Int64, read_prefs : ReadPrefs*, error : BSON_error*) : Int64 # BSON_GNUC_DEPRECATED_FOR(mongoc_collection_count_documents or mongoc_collection_estimated_document_count)
  fun collection_count_with_opts = mongoc_collection_count_with_opts(collection : Collection*, flags : QueryFlags, query : BSON*, skip : Int64, limit : Int64, opts : BSON*, read_prefs : ReadPrefs*, error : BSON_error*) : Int64 # BSON_GNUC_DEPRECATED_FOR(mongoc_collection_count_documents or mongoc_collection_estimated_document_count)
  fun collection_create_bulk_operation = mongoc_collection_create_bulk_operation(collection : Collection*, ordered : Bool, write_concern : WriteConcern*) : BulkOperation* # BSON_GNUC_WARN_UNUSED_RESULT BSON_GNUC_DEPRECATED_FOR(mongoc_collection_create_bulk_operation_with_opts)
  fun collection_create_bulk_operation_with_opts = mongoc_collection_create_bulk_operation_with_opts(collection : Collection*, opts : BSON*) : BulkOperation* # BSON_GNUC_WARN_UNUSED_RESULT
  fun collection_create_index = mongoc_collection_create_index(collection : Collection*, keys : BSON*, opt : IndexOpt*, error : BSON_error*) : Bool
  fun collection_create_index_with_opts = mongoc_collection_create_index_with_opts(collection : Collection*, keys : BSON*, index_opts : IndexOpt*, command_opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
  fun collection_delete = mongoc_collection_delete(collection : Collection*, flags : DeleteFlags, selector : BSON*, write_concern : WriteConcern*, error : BSON_error*) : Bool # BSON_GNUC_DEPRECATED_FOR(mongoc_collection_delete_one or mongoc_collection_delete_many)
  fun collection_delete_many = mongoc_collection_delete_many(collection : Collection*, selector : BSON*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
  fun collection_delete_one = mongoc_collection_delete_one(collection : Collection*, selector : BSON*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
  fun collection_destroy = mongoc_collection_destroy(collection : Collection*) : Void
  fun collection_drop = mongoc_collection_drop(collection : Collection*, error : BSON_error*) : Bool
  fun collection_drop_index = mongoc_collection_drop_index(collection : Collection*, index_name : Int8*, error : BSON_error*) : Bool
  fun collection_drop_index_with_opts = mongoc_collection_drop_index_with_opts(collection : Collection*, index_name : Int8*, opts : BSON*, error : BSON_error*) : Bool
  fun collection_drop_with_opts = mongoc_collection_drop_with_opts(collection : Collection*, opts : BSON*, error : BSON_error*) : Bool
  fun collection_ensure_index = mongoc_collection_ensure_index(collection : Collection*, keys : BSON*, opt : IndexOpt*, error : BSON_error*) : Bool # BSON_GNUC_DEPRECATED
  fun collection_find = mongoc_collection_find(collection : Collection*, flags : QueryFlags, skip : UInt32, limit : UInt32, batch_size : UInt32, query : BSON*, fields : BSON*, read_prefs : ReadPrefs*) : Cursor* # BSON_GNUC_DEPRECATED_FOR(mongoc_collection_find_with_opts) BSON_GNUC_WARN_UNUSED_RESULT
  fun collection_find_and_modify = mongoc_collection_find_and_modify(collection : Collection*, query : BSON*, sort : BSON*, update : BSON*, fields : BSON*, _remove : Bool, upsert : Bool, _new : Bool, reply : BSON*, error : BSON_error*) : Bool
  fun collection_find_and_modify_with_opts = mongoc_collection_find_and_modify_with_opts(collection : Collection*, query : BSON*, opts : FindAndModifyOpts*, reply : BSON*, error : BSON_error*) : Bool
  fun collection_find_indexes = mongoc_collection_find_indexes(collection : Collection*, error : BSON_error*) : Cursor* 
  fun collection_find_indexes_with_opts = mongoc_collection_find_indexes_with_opts(collection : Collection*, opts : BSON*) : Cursor*
  fun collection_find_with_opts = mongoc_collection_find_with_opts(collection : Collection*, filter : BSON*, opts : BSON*, read_prefs : ReadPrefs*) : Cursor* # BSON_GNUC_WARN_UNUSED_RESULT
  fun collection_get_last_error = mongoc_collection_get_last_error(collection : Collection*) : BSON*
  fun collection_get_name = mongoc_collection_get_name(collection : Collection*) : UInt8*
  fun collection_get_read_concern = mongoc_collection_get_read_concern(collection : Collection*) : ReadConcern*
  fun collection_get_read_prefs = mongoc_collection_get_read_prefs(collection : Collection*) : ReadPrefs*
  fun collection_get_write_concern = mongoc_collection_get_write_concern(collection : Collection*) : WriteConcern*
  fun collection_insert = mongoc_collection_insert(collection : Collection*, flags : InsertFlags, document : BSON*, write_concern : WriteConcern*, error : BSON_error*) : Bool
  fun collection_insert_bulk = mongoc_collection_insert_bulk(collection : Collection*, flags : InsertFlags, documents : BSON**, n_documents : UInt32, write_concern : WriteConcern*, error : BSON_error*) : Bool # BSON_GNUC_DEPRECATED_FOR(mongoc_collection_insert_many)
  fun collection_insert_many = mongoc_collection_insert_many(collection : Collection*, documents : BSON**, n_documents : SizeT, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
  fun collection_insert_one = mongoc_collection_insert_one(collection : Collection*, document : BSON*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
  fun collection_keys_to_index_string = mongoc_collection_keys_to_index_string(keys : BSON*) : Int8*
  fun collection_read_command_with_opts = mongoc_collection_read_command_with_opts(collection : Collection*, command : BSON*, read_prefs : ReadPrefs*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
  fun collection_read_write_command_with_opts = mongoc_collection_read_write_command_with_opts(collection : Collection*, command : BSON*, read_prefs : ReadPrefs*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
  fun collection_remove = mongoc_collection_remove(collection : Collection*, flags : RemoveFlags, selector : BSON*, write_concern : WriteConcern*, error : BSON_error*) : Bool
  fun collection_rename = mongoc_collection_rename(collection : Collection*, new_db : Int8*, new_name : Int8*, drop_target_before_rename : Bool, error : BSON_error*) : Bool
  fun collection_rename_with_opts = mongoc_collection_rename_with_opts(collection : Collection*, new_db : Int8, new_name : Int8, drop_target_before_rename : Bool, opts : BSON*, error : BSON_error*) : Bool
  fun collection_replace_one = mongoc_collection_replace_one(collection : Collection*, selector : BSON*, replacement : BSON*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
  fun collection_save = mongoc_collection_save(collection : Collection*, document : BSON*, write_concern : WriteConcern*, error : BSON_error*) : Bool # BSON_GNUC_DEPRECATED_FOR(mongoc_collection_insert_one or mongoc_collection_replace_one)
  fun collection_set_read_concern = mongoc_collection_set_read_concern(collection : Collection*, read_concern : ReadConcern*) : Void
  fun collection_set_read_prefs = mongoc_collection_set_read_prefs(collection : Collection*, read_prefs : ReadPrefs*) : Void
  fun collection_set_write_concern = mongoc_collection_set_write_concern(collection : Collection*, write_concern : WriteConcern *) : Void
  fun collection_stats = mongoc_collection_stats(collection : Collection*, options : BSON*, reply : BSON*, error : BSON_error*) : Bool # BSON_GNUC_DEPRECATED
  fun collection_update = mongoc_collection_update(collection : Collection*, flags : UpdateFlags, selector : BSON*, update : BSON*, write_concern : WriteConcern*, error : BSON_error*) : Bool
  fun collection_update_one = mongoc_collection_update_one(collection : Collection*, selector : BSON*, update : BSON*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
  fun collection_update_many = mongoc_collection_update_many(collection : Collection*, selector : BSON*, update : BSON*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
  fun collection_validate = mongoc_collection_validate(collection : Collection*, options : BSON*, reply : BSON*, error : BSON_error*) : Bool
  fun collection_write_command_with_opts = mongoc_collection_write_command_with_opts(collection : Collection*, command : BSON*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool

  ### mongoc_cursor_t
  # typedef struct _mongoc_cursor_t mongoc_cursor_t;
  type Cursor = Void

  fun cursor_clone = mongoc_cursor_clone(cursor : Cursor*) : Cursor* # BSON_GNUC_WARN_UNUSED_RESULT
  fun cursor_current = mongoc_cursor_current(cursor : Cursor*) : BSON*
  fun cursor_destroy = mongoc_cursor_destroy(cursor : Cursor*) : Void
  fun cursor_error = mongoc_cursor_error(cursor : Cursor*, error : BSON_error*) : Bool
  fun cursor_error_document = mongoc_cursor_error_document(cursor : Cursor*, error : BSON*, reply : BSON**) : Bool
  fun cursor_get_batch_size = mongoc_cursor_get_batch_size(cursor : Cursor*) : UInt32
  fun cursor_get_hint = mongoc_cursor_get_hint(cursor : Cursor*) : UInt32
  fun cursor_get_host = mongoc_cursor_get_host(cursor : Cursor*, host : HostList*) : Void
  fun cursor_get_id = mongoc_cursor_get_id(cursor : Cursor*) : Int64
  fun cursor_get_limit = mongoc_cursor_get_limit(cursor : Cursor*) : Int64
  fun cursor_get_max_await_time_ms = mongoc_cursor_get_max_await_time_ms(cursor : Cursor*) : UInt32
  fun cursor_is_alive = mongoc_cursor_is_alive(cursor : Cursor*) : Bool # BSON_GNUC_DEPRECATED_FOR(mongoc_cursor_more)
  fun cursor_more = mongoc_cursor_more(cursor : Cursor*) : Bool
  fun cursor_new_from_command_reply = mongoc_cursor_new_from_command_reply(client : Client*, reply : BSON*, server_id : UInt32) : Cursor* # BSON_GNUC_DEPRECATED_FOR(mongoc_cursor_new_from_command_reply_with_opts)
  fun cursor_new_from_command_reply_with_opts = mongoc_cursor_new_from_command_reply_with_opts(client : Client*, reply : BSON*, opts : BSON*) : Cursor*
  fun cursor_next = mongoc_cursor_next(cursor : Cursor*, bson : BSON**) : Bool
  fun cursor_set_batch_size = mongoc_cursor_set_batch_size(cursor : Cursor*, batch_size : UInt32) : Void
  fun cursor_set_hint = mongoc_cursor_set_hint(cursor : Cursor*, server_id : UInt32) : Bool
  fun cursor_set_limit = mongoc_cursor_set_limit(cursor : Cursor*, limit : Int64) : Bool
  fun cursor_set_max_await_time_ms = mongoc_cursor_set_max_await_time_ms(cursor : Cursor*, max_await_time_ms : UInt32) : Void

  ### mongoc_database_t
  # typedef struct _mongoc_database_t mongoc_database_t;
  type Database = Void

  fun database_add_user = mongoc_database_add_user(database : Database*, username : Int8*, password : Int8*, roles : BSON*, custom_data : BSON*, error : BSON_error*) : Bool
  fun database_aggregate = mongoc_database_aggregate(database : Database*, pipeline : BSON*, opts : BSON *, read_prefs : ReadPrefs*) : Cursor* # BSON_GNUC_WARN_UNUSED_RESULT
  fun database_command = mongoc_database_command(database : Database*, flags : QueryFlags, skip : UInt32, limit : UInt32, batch_size : UInt32, command : BSON*, fields : BSON*, read_prefs : ReadPrefs*) : Cursor*
  fun database_command_simple = mongoc_database_command_simple(database : Database*, command : BSON*, read_prefs : ReadPrefs*, reply : BSON*, error : BSON_error*) : Bool
  fun database_command_with_opts = mongoc_database_command_with_opts(database : Database*, command : BSON*, read_prefs : ReadPrefs*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
  fun database_copy = mongoc_(database : Database*) : Database*
  fun database_create_collection = mongoc_database_create_collection(database : Database*, name : Int8*, opts : BSON*, error : BSON_error*) : Collection*
  fun database_destroy = mongoc_database_destroy(database : Database*) : Void
  fun database_drop = mongoc_database_drop(database : Database*, error : BSON_error*) : Bool
  fun database_drop_with_opts = mongoc_database_drop_with_opts(database : Database*, opts : BSON*, error : BSON_error*) : Bool
  fun database_find_collections = mongoc_database_find_collections(database : Database*, filter : BSON*, error : BSON_error*) : Cursor* # BSON_GNUC_DEPRECATED_FOR(mongoc_database_find_collections_with_opts)
  fun database_find_collections_with_opts = mongoc_database_find_collections_with_opts(database : Database*, opts : BSON*) : Cursor*
  fun database_get_collection = mongoc_database_get_collection(database : Database*, name : UInt8*) : Collection*
  fun database_get_collection_names = mongoc_database_get_collection_names(database : Database*, error : BSON_error*) : Int8**
  fun database_get_collection_names_with_opts = mongoc_database_get_collection_names_with_opts(database : Database*, opts : BSON*, error : BSON_error*) : Int8**
  fun database_get_name = mongoc_database_get_name(database : Database*) : UInt8*
  fun database_get_read_concern = mongoc_database_get_read_concern(database : Database*) : ReadConcern*
  fun database_get_read_prefs = mongoc_database_get_read_prefs(database : Database*) : ReadPrefs*
  fun database_get_write_concern = mongoc_database_get_write_concern(database : Database*) : WriteConcern*
  fun database_has_collection = mongoc_database_has_collection(database : Database*, name : Int8*, error : BSON_error*) : Bool
  fun database_read_command_with_opts = mongoc_database_read_command_with_opts(database : Database*, command : BSON*, read_prefs : ReadPrefs*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
  fun database_read_write_command_with_opts = mongoc_database_read_write_command_with_opts(database : Database*, command : BSON*, read_prefs : ReadPrefs*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
  fun database_remove_all_users = mongoc_database_remove_all_users(database : Database*, error : BSON_error*) : Bool
  fun database_remove_user = mongoc_database_remove_user(database : Database*, username : Int8*, error : BSON_error*) : Bool
  fun database_set_read_concern = mongoc_database_set_read_concern(database : Database*, read_concern : ReadConcern*) : Void
  fun database_set_read_prefs = mongoc_database_set_read_prefs(database : Database*, read_prefs : ReadPrefs*) : Void
  fun database_set_write_concern = mongoc_database_set_write_concern(database : Database*, write_concern : WriteConcern*) : Void
  fun database_watch = mongoc_database_watch(db : Database*, pipeline : BSON*, opts : BSON*) : ChangeStream*
  fun database_write_command_with_opts = mongoc_database_write_command_with_opts(database : Database*, command : BSON*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool 

  ### mongoc_delete_flags_t
  enum DeleteFlags
    MONGOC_DELETE_NONE = 0
    MONGOC_DELETE_SINGLE_REMOVE = 1 << 0
  end

  ### mongoc_find_and_modify_opts_t
  type FindAndModifyOpts = Void

  fun find_and_modify_opts_append = mongoc_find_and_modify_opts_append(opts : FindAndModifyOpts*, extra : BSON*) : Bool
  fun find_and_modify_opts_destroy = mongoc_find_and_modify_opts_destroy(find_and_modify_opts : FindAndModifyOpts*) : Void
  fun find_and_modify_opts_get_bypass_document_validation = mongoc_find_and_modify_opts_get_bypass_document_validation(opts : FindAndModifyOpts*) : Bool
  fun find_and_modify_opts_get_fields = mongoc_find_and_modify_opts_get_fields(opts : FindAndModifyOpts*, fields : BSON*) : Void
  # fun find_and_modify_opts_get_flags = mongoc_find_and_modify_opts_get_flags(opts : FindAndModifyOpts*) : FindAndModifyFlags
  fun find_and_modify_opts_get_max_time_ms = mongoc_find_and_modify_opts_get_max_time_ms(opts : FindAndModifyOpts*) : UInt32
  fun find_and_modify_opts_get_sort = mongoc_find_and_modify_opts_get_sort(opts : FindAndModifyOpts*, sort : BSON*) : Void
  fun find_and_modify_opts_get_update = mongoc_find_and_modify_opts_get_update(opts : FindAndModifyOpts*, update : BSON*) : Void
  fun find_and_modify_opts_new = mongoc_find_and_modify_opts_new : FindAndModifyOpts*
  fun find_and_modify_opts_set_bypass_document_validation = mongoc_find_and_modify_opts_set_bypass_document_validation(opts : FindAndModifyOpts*, bypass : Bool) : Bool
  fun find_and_modify_opts_set_fields = mongoc_find_and_modify_opts_set_fields(opts : FindAndModifyOpts*, fields : BSON*) : Bool
  # fun find_and_modify_opts_set_flags = mongoc_find_and_modify_opts_set_flags(opts : FindAndModifyOpts*, flags : FindAndModifyFlags) : Bool
  fun find_and_modify_opts_set_max_time_ms = mongoc_find_and_modify_opts_set_max_time_ms(opts : FindAndModifyOpts*, max_time_ms : UInt32) : Bool
  fun find_and_modify_opts_set_sort = mongoc_find_and_modify_opts_set_sort(opts : FindAndModifyOpts*, sort : BSON*) : Bool
  fun find_and_modify_opts_set_update = mongoc_find_and_modify_opts_set_update(opts : FindAndModifyOpts*, update : BSON*) : Bool

  ### mongoc_gridfs_file_list_t
  # typedef struct _mongoc_gridfs_file_list_t mongoc_gridfs_file_list_t;
  type GridfsFileList = Void

  fun gridfs_file_list_destroy = mongoc_gridfs_file_list_destroy(list : GridfsFileList*) : Void
  fun gridfs_file_list_error = mongoc_gridfs_file_list_error(list : GridfsFileList*, error : BSON_error*) : Bool
  fun gridfs_file_list_next = mongoc_gridfs_file_list_next(list : GridfsFileList*) : GridfsFile*

  ### mongoc_gridfs_file_opt_t
  struct GridfsFileOpt
    md5 : Int8*
    filename : Int8*
    content_type : Int8*
    aliases : BSON*
    metadata : BSON*
    chunk_size : UInt32
  end

  ### mongoc_gridfs_file_t
  # typedef struct _mongoc_gridfs_file_t mongoc_gridfs_file_t;
  type GridfsFile = Void

  fun gridfs_file_destroy = mongoc_gridfs_file_destroy(file : GridfsFile*) : Void
  fun gridfs_file_error = mongoc_gridfs_file_error(file : GridfsFile*, error : BSON_error*) : Bool
  fun gridfs_file_get_aliases = mongoc_gridfs_file_get_aliases(file : GridfsFile*) : BSON*
  fun gridfs_file_get_chunk_size = mongoc_gridfs_file_get_chunk_size(file : GridfsFile*) : Int32
  fun gridfs_file_get_content_type = mongoc_gridfs_file_get_content_type(file : GridfsFile*) : Int8*
  fun gridfs_file_get_filename = mongoc_gridfs_file_get_filename(file : GridfsFile*) : Int8*
  fun gridfs_file_get_id = mongoc_gridfs_file_get_id(file : GridfsFile*) : BSON_value*
  fun gridfs_file_get_length = mongoc_gridfs_file_get_length(file : GridfsFile*) : Int64
  fun gridfs_file_get_md5 = mongoc_gridfs_file_get_md5(file : GridfsFile*) : Int8*
  fun gridfs_file_get_metadata = mongoc_gridfs_file_get_metadata(file : GridfsFile*) : BSON*
  fun gridfs_file_get_upload_date = mongoc_gridfs_file_get_upload_date(file : GridfsFile*) : Int64
  # fun gridfs_file_readv = mongoc_gridfs_file_readv(file : GridfsFile*, iov : Iovec*, iovcnt : SizeT, min_bytes : SizeT, timeout_msec : UInt32) : SSizeT
  fun gridfs_file_remove = mongoc_gridfs_file_remove(file : GridfsFile*, error : BSON_error*) : Bool
  fun gridfs_file_save = mongoc_gridfs_file_save(file : GridfsFile*) : Bool
  fun gridfs_file_seek = mongoc_gridfs_file_seek(file : GridfsFile*, delta : Int64, whence : Int32) : Int32
  fun gridfs_file_set_aliases = mongoc_gridfs_file_set_aliases(file : GridfsFile*, bson : BSON*) : Void
  fun gridfs_file_set_content_type = mongoc_gridfs_file_set_content_type(file : GridfsFile*, content_type : Int8*) : Void
  fun gridfs_file_set_filename = mongoc_gridfs_file_set_filename(file : GridfsFile*, filename : Int8*) : Void
  # fun gridfs_file_set_id = mongoc_gridfs_file_set_id(file : GridfsFile*, id : BSON_value*, error : BSON_error) : Bool
  fun gridfs_file_set_md5 = mongoc_gridfs_file_set_md5(file : GridfsFile*, md5 : Int8*) : Void
  fun gridfs_file_set_metadata = mongoc_gridfs_file_set_metadata(file : GridfsFile*, metadata : BSON*) : Void
  fun gridfs_file_tell = mongoc_gridfs_file_tell(file : GridfsFile*) : UInt64
  # fun gridfs_file_writev = mongoc_gridfs_file_writev(file : GridfsFile*, iov : Iovec*, iovcnt : SizeT, timeout_msec : UInt32) : SSizeT
  fun stream_gridfs_new = mongoc_stream_gridfs_new(file : GridfsFile*) : Stream*

  ### mongoc_gridfs_bucket_t
  # typedef struct _mongoc_gridfs_bucket_t mongoc_gridfs_bucket_t;
  type GridfsBucket = Void

  fun gridfs_bucket_abort_upload = mongoc_gridfs_bucket_abort_upload(stream : Stream*) : Bool
  fun gridfs_bucket_delete_by_id = mongoc_gridfs_bucket_delete_by_id(bucket : GridfsBucket*, file_id : BSON_value*, error : BSON_error*) : Bool
  fun gridfs_bucket_destroy = mongoc_gridfs_bucket_destroy(bucket : GridfsBucket*) : Void
  fun gridfs_bucket_download_to_stream = mongoc_gridfs_bucket_download_to_stream(bucket : GridfsBucket*, file_id : BSON_value*, destination : Stream*, error : BSON_error*) : Bool
  fun gridfs_bucket_find = mongoc_gridfs_bucket_find(bucket : GridfsBucket*, filter : BSON*, opts : BSON*) : Cursor*
  fun gridfs_bucket_new = mongoc_gridfs_bucket_new(db : Database*, opts : BSON*, read_prefs : ReadPrefs*, error : BSON_error*) : GridfsBucket*
  fun gridfs_bucket_open_download_stream = mongoc_gridfs_bucket_open_download_stream(bucket : GridfsBucket*, file_id : BSON_value*, error : BSON_error*) : Stream*
  fun gridfs_bucket_open_upload_stream = mongoc_gridfs_bucket_open_upload_stream(bucket : GridfsBucket*, filename : Int8*, opts : BSON*, file_id : BSON_value*, error : BSON_error*) : Stream*
  fun gridfs_bucket_open_upload_stream_with_id = mongoc_gridfs_bucket_open_upload_stream_with_id(bucket : GridfsBucket*, file_id : BSON_value*, filename : Int8*, opts : BSON*, error : BSON_error*) : Stream*
  fun gridfs_bucket_stream_error = mongoc_gridfs_bucket_stream_error(stream : Stream*, error : BSON_error*) : Bool
  fun gridfs_bucket_upload_from_stream = mongoc_gridfs_bucket_upload_from_stream(bucket : GridfsBucket*, filename : Int8*, source : Stream*, opts : BSON*, file_id : BSON_value*, error : BSON_error*) : Bool
  fun gridfs_bucket_upload_from_stream_with_id = mongoc_gridfs_bucket_upload_from_stream_with_id(bucket : GridfsBucket*, file_id : BSON_value*, filename : Int8*, source : Stream*, opts : BSON*, error : BSON_error*) : Bool

  ### mongoc_gridfs_t
  # typedef struct _mongoc_gridfs_t mongoc_gridfs_t;
  type Gridfs = Void

  fun gridfs_create_file = mongoc_gridfs_create_file(gridfs : Gridfs*, opt : GridfsFileOpt*) : GridfsFile*
  fun gridfs_create_file_from_stream = mongoc_gridfs_create_file_from_stream(gridfs : Gridfs*, stream : Stream*, opt : GridfsFileOpt*) : GridfsFile*
  fun gridfs_destroy = mongoc_gridfs_destroy(gridfs : Gridfs*) : Void
  fun gridfs_drop = mongoc_gridfs_drop(gridfs : Gridfs*, error : BSON_error*) : Bool
  fun gridfs_find = mongoc_gridfs_find(gridfs : Gridfs*, query : BSON*) : GridfsFileList* # BSON_GNUC_DEPRECATED_FOR(mongoc_gridfs_find_with_opts)
  fun gridfs_find_one = mongoc_gridfs_find_one(gridfs : Gridfs*, query : BSON*, error : BSON_error*) : GridfsFile* # BSON_GNUC_DEPRECATED_FOR (mongoc_gridfs_find_one_with_opts);
  fun gridfs_find_one_by_filename = mongoc_gridfs_find_one_by_filename(gridfs : Gridfs*, filename : Int8*, error : BSON_error*) : GridfsFile*
  fun gridfs_find_one_with_opts = mongoc_gridfs_find_one_with_opts(gridfs : Gridfs*, filter : BSON*, opts : BSON*, error : BSON_error*) : GridfsFile* # BSON_GNUC_WARN_UNUSED_RESULT;
  fun gridfs_find_with_opts = mongoc_gridfs_find_with_opts(gridfs : Gridfs*, filter : BSON*, opts : BSON*) : GridfsFileList* # BSON_GNUC_WARN_UNUSED_RESULT;
  fun gridfs_get_chunks = mongoc_gridfs_get_chunks(gridfs : Gridfs*) : Collection*
  fun gridfs_get_files = mongoc_gridfs_get_files(gridfs : Gridfs*) : Collection*
  fun gridfs_remove_by_filename = mongoc_gridfs_remove_by_filename(gridfs : Gridfs*, filename : Int8*, error : BSON_error*) : Bool

  ### mongoc_host_list_t
  type HostList = Void
  # struct HostList
  #   next : HostList*
  #   host[BSON_HOST_NAME_MAX + 1] : Int8
  #   host_and_port[BSON_HOST_NAME_MAX + 7] : Int8
  #   port : UInt16
  #   family : Int32
  #   padding : Void[4]*
  # end

  ### mongoc_index_opt_geo_t
  struct IndexOptGeo
    twod_sphere_version : UInt8
    twod_bits_precision : UInt8
    twod_location_min : Float64
    twod_location_max : Float64
    haystack_bucket_size : Float64
    padding : UInt8[32]*
  end
 
  fun index_opt_geo_get_default = mongoc_index_opt_geo_get_default : IndexOptGeo* # BSON_GNUC_PURE
  fun index_opt_geo_init = mongoc_index_opt_geo_init(opt : IndexOptGeo*) : Void 

  ### mongoc_index_opt_t
  type IndexOptStorage = Void

  struct IndexOpt
    is_initialized : Bool
    background : Bool
    unique : Bool 
    name : Int8*
    drop_dups : Bool
    sparse : Bool
    expire_after_seconds : Int32
    v : Int32
    weights : BSON*
    default_language : Int8*
    language_override : Int8*
    geo_options : IndexOptGeo*
    storage_options : IndexOptStorage*
    partial_filter_expression : BSON*
    collation : BSON*
    padding : Void[4]*
  end

  fun index_opt_get_default = mongoc_index_opt_get_default : IndexOpt* # BSON_GNUC_PURE
  fun index_opt_init = mongoc_index_opt_init(opt : IndexOpt*) : Void

  ### mongoc_index_opt_wt_t
  type IndexOptWt = Void
  # struct IndexOptWt
  #   mongoc_index_opt_storage_t base;
  #   const char *config_str;
  #   void *padding[8];
  # end

  fun index_opt_wt_get_default = mongoc_index_opt_wt_get_default : IndexOptWt* # BSON_GNUC_PURE
  fun index_opt_wt_init = mongoc_index_opt_wt_init(opt : IndexOptWt*) : Void

  ### mongoc_insert_flags_t
  enum InsertFlags
    MONGOC_INSERT_NONE = 0
    MONGOC_INSERT_CONTINUE_ON_ERROR = 1 << 0
  end
  #define MONGOC_INSERT_NO_VALIDATE (1U << 31)

  ### mongoc_iovec_t
  #ifdef _WIN32
  # typedef struct {
  #   u_long iov_len;
  #   char *iov_base;
  # } mongoc_iovec_t;
  #else
  # typedef struct iovec mongoc_iovec_t;
  #endif

  ### mongoc_matcher_t
  # typedef struct _mongoc_matcher_t mongoc_matcher_t;
  type Matcher = Void

  fun matcher_destroy = mongoc_matcher_destroy(matcher : Matcher*) : Void
  fun matcher_match = mongoc_matcher_match(matcher : Matcher*, document : BSON*) : Bool
  fun matcher_new = mongoc_matcher_new(query : BSON*, error : BSON_error*) : Matcher*

  ### mongoc_query_flags_t
  enum QueryFlags
    MONGOC_QUERY_NONE = 0
    MONGOC_QUERY_TAILABLE_CURSOR = 1 << 1
    MONGOC_QUERY_SLAVE_OK = 1 << 2
    MONGOC_QUERY_OPLOG_REPLAY = 1 << 3
    MONGOC_QUERY_NO_CURSOR_TIMEOUT = 1 << 4
    MONGOC_QUERY_AWAIT_DATA = 1 << 5
    MONGOC_QUERY_EXHAUST = 1 << 6
    MONGOC_QUERY_PARTIAL = 1 << 7
  end

  ### mongoc_rand
  fun rand_add = mongoc_rand_add(buf : Void*, num : Int32, entropy : Float64) : Void
  fun rand_seed = mongoc_rand_seed(buf : Void*, num : Int32) : Void
  fun rand_status = mongoc_rand_status : Int32

  ### mongoc_read_concern_t
  type ReadConcern = Void

  fun read_concern_append = mongoc_read_concern_append(read_concern : ReadConcern*, opts : BSON*) : Bool
  fun read_concern_copy = mongoc_read_concern_copy(read_concern : ReadConcern*) : ReadConcern*
  fun read_concern_destroy = mongoc_read_concern_destroy(read_concern : ReadConcern*) : Void
  fun read_concern_get_level = mongoc_read_concern_get_level(read_concern : ReadConcern*) : Int8*
  fun read_concern_is_default = mongoc_read_concern_is_default(read_concern : ReadConcern*) : Bool
  fun read_concern_new = mongoc_read_concern_new : ReadConcern*
  fun read_concern_set_level = mongoc_read_concern_set_level(read_concern : ReadConcern*, level : Int8*) : Bool

  ### mongoc_read_mode_t
  enum ReadMode
    MONGOC_READ_PRIMARY = 1 << 0
    MONGOC_READ_SECONDARY = 1 << 1
    MONGOC_READ_PRIMARY_PREFERRED = (1 << 2) | MONGOC_READ_PRIMARY
    MONGOC_READ_SECONDARY_PREFERRED = (1 << 2) | MONGOC_READ_SECONDARY
    MONGOC_READ_NEAREST = (1 << 3) | MONGOC_READ_SECONDARY
  end

  ### mongoc_read_prefs_t
  type ReadPrefs = Void

  fun read_prefs_add_tag = mongoc_read_prefs_add_tag(read_prefs : ReadPrefs*, tag : BSON*) : Void
  fun read_prefs_copy = mongoc_read_prefs_copy(read_prefs : ReadPrefs*) : ReadPrefs*
  fun read_prefs_destroy = mongoc_read_prefs_destroy(read_prefs : ReadPrefs*) : Void
  fun read_prefs_get_max_staleness_seconds = mongoc_read_prefs_get_max_staleness_seconds(read_prefs : ReadPrefs*) : Int64
  fun read_prefs_get_mode = mongoc_read_prefs_get_mode(read_prefs : ReadPrefs*) : ReadMode
  fun read_prefs_get_tags = mongoc_read_prefs_get_tags(read_prefs : ReadPrefs*) : BSON*
  fun read_prefs_is_valid = mongoc_read_prefs_is_valid(read_prefs : ReadPrefs*) : Bool
  fun read_prefs_new = mongoc_read_prefs_new(read_mode : ReadMode) : ReadPrefs*
  fun read_prefs_set_max_staleness_seconds = mongoc_read_prefs_set_max_staleness_seconds(read_prefs : ReadPrefs*, max_staleness_seconds : Int64) : Void
  fun read_prefs_set_mode = mongoc_read_prefs_set_mode(read_prefs : ReadPrefs*, mode : ReadMode) : Void
  fun read_prefs_set_tags = mongoc_read_prefs_set_tags(read_prefs : ReadPrefs*, tags : BSON*) : Void

  ### mongoc_remove_flags_t
  enum RemoveFlags
    MONGOC_REMOVE_NONE = 0
    MONGOC_REMOVE_SINGLE_REMOVE = 1 << 0
  end

  ### mongoc_reply_flags_t
  enum ReplyFlags
    MONGOC_REPLY_NONE = 0
    MONGOC_REPLY_CURSOR_NOT_FOUND = 1 << 0
    MONGOC_REPLY_QUERY_FAILURE = 1 << 1
    MONGOC_REPLY_SHARD_CONFIG_STALE = 1 << 2
    MONGOC_REPLY_AWAIT_CAPABLE = 1 << 3
  end

  ### mongoc_server_description_t
  # typedef struct _mongoc_server_description_t mongoc_server_description_t
  type ServerDescription = Void

  fun server_description_destroy = mongoc_server_description_destroy(description : ServerDescription*) : Void
  fun server_description_host = mongoc_server_description_host(description : ServerDescription*) : HostList*
  fun server_description_id = mongoc_server_description_id(description : ServerDescription*) : UInt32
  fun server_description_ismaster = mongoc_server_description_ismaster(description : ServerDescription*) : BSON*
  fun server_description_last_update_time = mongoc_server_description_last_update_time(description : ServerDescription*) : Int64
  fun server_description_new_copy = mongoc_server_description_new_copy(description : ServerDescription*) : ServerDescription*
  fun server_description_round_trip_time = mongoc_server_description_round_trip_time(description : ServerDescription*) : Int64
  fun server_description_type = mongoc_server_description_type(description : ServerDescription*) : Int8*
  fun server_descriptions_destroy_all = mongoc_server_descriptions_destroy_all(sds : ServerDescription**, n : SizeT) : Void

  ### mongoc_session_opt_t
  # typedef struct _mongoc_session_opt_t mongoc_session_opt_t;
  type SessionOpt = Void

  fun session_opts_new = mongoc_session_opts_new : SessionOpt*
  fun session_opts_get_causal_consistency = mongoc_session_opts_get_causal_consistency(opts : SessionOpt*) : Bool
  fun session_opts_set_causal_consistency = mongoc_session_opts_set_causal_consistency(opts : SessionOpt*, causal_consistency : Bool) : Void
  fun session_opts_get_default_transaction_opts = mongoc_session_opts_get_default_transaction_opts(opts : SessionOpt*) : TransactionOpt*
  fun session_opts_set_default_transaction_opts = mongoc_session_opts_set_default_transaction_opts(opts : SessionOpt*, txn_opts : TransactionOpt*) : Void
  fun session_opts_get_transaction_opts = mongoc_session_opts_get_transaction_opts(session : ClientSession*) : TransactionOpt*
  fun session_opts_clone = mongoc_session_opts_clone(opts : SessionOpt*) : SessionOpt*
  fun session_opts_destroy = mongoc_session_opts_destroy(opts : SessionOpt*) : Void

  ### mongoc_socket_t
  # typedef struct _mongoc_socket_t mongoc_socket_t
  type Socket = Void

  fun socket_accept = mongoc_socket_accept(sock : Socket*, expire_at : Int64) : Socket*
  # fun socket_bind = mongoc_socket_bind(sock : Socket*, const struct sockaddr *addr, mongoc_socklen_t addrlen) : Int32
  fun socket_close = mongoc_socket_close(socket : Socket*) : Int32
  # fun socket_connect = mongoc_socket_connect(sock : Socket*, const struct sockaddr *addr, mongoc_socklen_t addrlen, expire_at : Int64) : Int32
  fun socket_destroy = mongoc_socket_destroy(sock : Socket*) : Void
  fun socket_errno = mongoc_socket_errno(sock : Socket*) : Int32
  fun socket_getnameinfo = mongoc_socket_getnameinfo(sock : Socket*) : Int8*
  # fun socket_getsockname = mongoc_socket_getsockname(sock : Socket*, struct sockaddr *addr, mongoc_socklen_t *addrlen) : Int32
  fun socket_listen = mongoc_socket_listen(sock : Socket*, backlog : UInt32) : Int32
  fun socket_new = mongoc_socket_new(domain : Int32, type : Int32, protocol : Int32) : Socket*
  fun socket_recv = mongoc_socket_recv(sock : Socket*, buf : Void*, buflen : SizeT, flags : Int32, expire_at : Int64) : SSizeT
  fun socket_send = mongoc_socket_send(sock : Socket*, buf : Void*, buflen : SizeT, expire_at : Int64) : SSizeT
  # fun socket_sendv = mongoc_socket_sendv(sock : Socket*, iov : Iovec*, iovcnt : SizeT, expire_at : Int64) : SSizeT
  # fun socket_setsockopt = mongoc_socket_setsockopt(sock : Socket*, level : Int32, optname : Int32, optval : Void*, optlen : Socklen) : Int32

  ### mongoc_ssl_opt_t
  struct SslOpt
    pem_file : Int8*
    pem_pwd : Int8*
    ca_file : Int8*
    ca_dir : Int8*
    crl_file : Int8*
    weak_cert_validation : Bool
    allow_invalid_hostname : Bool
    padding : Void[7]*
  end

  fun ssl_opt_get_default = mongoc_ssl_opt_get_default : SslOpt* # BSON_GNUC_PURE

  ### mongoc_stream_buffered_t
  # typedef struct _mongoc_stream_buffered_t mongoc_stream_buffered_t
  type StreamBuffered = Void

  fun stream_buffered_new = mongoc_stream_buffered_new(base_stream : Stream*, buffer_size : SizeT) : Stream*
  fun stream_destroy = mongoc_stream_destroy(stream : Stream*) : Void

  ### mongoc_stream_file_t
  # typedef struct _mongoc_stream_file_t mongoc_stream_file_t
  type StreamFile = Void

  fun stream_file_get_fd = mongoc_stream_file_get_fd(stream : StreamFile*) : Int32
  fun stream_file_new = mongoc_stream_file_new(fd : Int32) : Stream*
  fun stream_file_new_for_path = mongoc_stream_file_new_for_path(path : Int8*, flags : Int32, mode : Int32) : Stream*

  ### mongoc_stream_socket_t
  # typedef struct _mongoc_stream_socket_t mongoc_stream_socket_t
  type StreamSocket = Void

  fun stream_socket_get_socket = mongoc_stream_socket_get_socket(stream : StreamSocket*) : Socket*
  fun stream_socket_new = mongoc_stream_socket_new(socket : Socket*) : Stream*

  ### mongoc_stream_t
  # typedef struct _mongoc_stream_t mongoc_stream_t
  type Stream = Void

  fun stream_buffered_new = mongoc_stream_buffered_new(base_stream : Stream*, buffer_size : SizeT) : Stream*
  fun stream_close = mongoc_stream_close(stream : Stream*) : Int32
  fun stream_cork = mongoc_stream_cork(stream : Stream*) : Int32
  fun stream_destroy = mongoc_stream_destroy(stream : Stream*) : Void
  fun stream_flush = mongoc_stream_flush(stream : Stream*) : Int32
  fun stream_get_base_stream = mongoc_stream_get_base_stream(stream : Stream*) : Stream*
  fun stream_read = mongoc_stream_read(stream : Stream*, buf : Void*, count : SizeT, min_bytes : SizeT, timeout_msec : Int32) : SSizeT
  # fun stream_readv = mongoc_stream_readv(stream : Stream*, iov : Iovec*, iovcnt : SizeT, min_bytes : SizeT, timeout_msec : Int32) : SSizeT
  # fun stream_setsockopt = mongoc_stream_setsockopt(stream : Stream*, level : Int32, optname : Int32, optval : Void*, optlen : Socklen) : Int32
  fun stream_should_retry = mongoc_stream_should_retry(stream : Stream*) : Bool
  fun stream_timed_out = mongoc_stream_timed_out(stream : Stream*) : Bool
  fun stream_uncork = mongoc_stream_uncork(stream : Stream*) : Int32
  fun stream_write = mongoc_stream_write(stream : Stream*, buf : Void*, count : SizeT, timeout_msec : Int32) : SSizeT
  # fun stream_writev = mongoc_stream_writev(stream : Stream*, iov : Iovec*, iovcnt : SizeT, timeout_msec : Int32) : SSizeT

  ### mongoc_stream_tls_t
  # typedef struct _mongoc_stream_tls_t mongoc_stream_tls_t
  type StreamTls = Void

  ### mongoc_topology_description_t
  # typedef struct _mongoc_topology_description_t mongoc_topology_description_t;
  type TopologyDescription = Void

  fun topology_description_get_servers = mongoc_topology_description_get_servers(td : TopologyDescription*, n : SizeT*) : ServerDescription**
  fun topology_description_has_readable_server = mongoc_topology_description_has_readable_server(td : TopologyDescription*, prefs : ReadPrefs*) : Bool
  fun topology_description_has_writable_server = mongoc_topology_description_has_writable_server(td : TopologyDescription*) : Bool
  fun topology_description_type = mongoc_topology_description_type(td : TopologyDescription*) : Int8*

  ### mongoc_transaction_opt_t
  # typedef struct _mongoc_transaction_opt_t mongoc_transaction_opt_t;
  type TransactionOpt = Void

  fun transaction_opts_new = mongoc_transaction_opts_new : TransactionOpt*
  fun transaction_opts_get_read_concern = mongoc_transaction_opts_get_read_concern(opts : TransactionOpt*) : ReadConcern*
  fun transaction_opts_set_read_concern = mongoc_transaction_opts_set_read_concern(opts : TransactionOpt*, read_concern : ReadConcern*) : Void
  fun transaction_opts_get_write_concern = mongoc_transaction_opts_get_write_concern(opts : TransactionOpt*) : WriteConcern*
  fun transaction_opts_set_write_concern = mongoc_transaction_opts_set_write_concern(opts : TransactionOpt*, write_concern : WriteConcern*) : Void
  fun transaction_opts_get_read_prefs = mongoc_transaction_opts_get_read_prefs(opts : TransactionOpt*) : ReadPrefs*
  fun transaction_opts_set_read_prefs = mongoc_transaction_opts_set_read_prefs(opts : TransactionOpt*, read_prefs : ReadPrefs*) : Void
  fun transaction_opts_get_max_commit_time_ms = mongoc_transaction_opts_get_max_commit_time_ms(opts : TransactionOpt*) : Int64
  fun transaction_opts_set_max_commit_time_ms = mongoc_transaction_opts_set_max_commit_time_ms(opts : TransactionOpt*, max_commit_time_ms : Int64) : Void
  fun transaction_opts_clone = mongoc_transaction_opts_clone(opts : TransactionOpt*) : TransactionOpt*
  fun transaction_opts_destroy = mongoc_transaction_opts_destroy(opts : TransactionOpt*) : Void

  ### mongoc_transaction_state_t
  enum TransactionState
    MONGOC_TRANSACTION_NONE = 0
    MONGOC_TRANSACTION_STARTING = 1
    MONGOC_TRANSACTION_IN_PROGRESS = 2
    MONGOC_TRANSACTION_COMMITTED = 3
    MONGOC_TRANSACTION_ABORTED = 4
  end

  ### mongoc_update_flags_t
  enum UpdateFlags
    MONGOC_UPDATE_NONE = 0
    MONGOC_UPDATE_UPSERT = 1 << 0
    MONGOC_UPDATE_MULTI_UPDATE = 1 << 1
  end
  #define MONGOC_UPDATE_NO_VALIDATE (1U << 31)

  ### mongoc_uri_t
  # typedef struct _mongoc_uri_t mongoc_uri_t;
  type Uri = Void

  fun uri_copy = mongoc_uri_copy(uri : Uri*) : Uri*
  fun uri_destroy = mongoc_uri_destroy(uri : Uri*) : Void
  fun uri_get_auth_mechanism = mongoc_uri_get_auth_mechanism(uri : Uri*) : Int8*
  fun uri_get_auth_source = mongoc_uri_get_auth_source(uri : Uri*) : Int8*
  fun uri_get_compressors = mongoc_uri_get_compressors(uri : Uri*) : BSON*
  fun uri_get_database = mongoc_uri_get_database(uri : Uri*) : Int8*
  fun uri_get_hosts = mongoc_uri_get_hosts(uri : Uri*) : HostList*
  fun uri_get_mechanism_properties = mongoc_uri_get_mechanism_properties(uri : Uri*, properties : BSON*) : Bool
  fun uri_get_option_as_bool = mongoc_uri_get_option_as_bool(uri : Uri*, option : Int8*, fallback : Bool) : Bool
  fun uri_get_option_as_int32 = mongoc_uri_get_option_as_int32(uri : Uri*, option : Int8*, fallback : Int32) : Int32
  fun uri_get_option_as_int64 = mongoc_uri_get_option_as_int64(uri : Uri*, option : Int8*, fallback : Int64) : Int64
  fun uri_get_option_as_utf8 = mongoc_uri_get_option_as_utf8(uri : Uri*, option : Int8*, fallback : Int8*) : Int8*
  fun uri_get_options = mongoc_uri_get_options(uri : Uri*) : BSON*
  fun uri_get_password = mongoc_uri_get_password(uri : Uri*) : Int8*
  fun uri_get_read_concern = mongoc_uri_get_read_concern(uri : Uri*) : ReadConcern*
  fun uri_get_read_prefs = mongoc_uri_get_read_prefs(uri : Uri*) : BSON*
  fun uri_get_read_prefs_t = mongoc_uri_get_read_prefs_t(uri : Uri*) : ReadPrefs*
  fun uri_get_replica_set = mongoc_uri_get_replica_set(uri : Uri*) : Int8*
  fun mongoc_uri_get_service = mongoc_uri_get_service(uri : Uri*) : Int8*
  fun uri_get_ssl = mongoc_uri_get_ssl(uri : Uri*) : Bool # BSON_GNUC_DEPRECATED_FOR(mongoc_uri_get_tls)
  fun uri_get_string = mongoc_uri_get_string(uri : Uri*) : Int8*
  fun uri_get_tls = mongoc_uri_get_tls(uri : Uri*) : Bool
  fun uri_get_username = mongoc_uri_get_username(uri : Uri*) : Int8*
  fun uri_get_write_concern = mongoc_uri_get_write_concern(uri : Uri*) : WriteConcern*
  fun uri_new = mongoc_uri_new(uri_string : Int8*) : Uri* # BSON_GNUC_WARN_UNUSED_RESULT
  fun uri_new_for_host_port = mongoc_uri_new_for_host_port(hostname : Int8*, port : UInt16) : Uri*
  fun uri_new_with_error = mongoc_uri_new_with_error(uri_string : Int8*, error : BSON_error*) : Uri* # BSON_GNUC_WARN_UNUSED_RESULT
  fun uri_option_is_bool = mongoc_uri_option_is_bool(option : Int8*) : Bool
  fun uri_option_is_int32 = mongoc_uri_option_is_int32(option : Int8*) : Bool
  fun uri_option_is_int64 = mongoc_uri_option_is_int64(option : Int8*) : Bool
  fun uri_option_is_utf8 = mongoc_uri_option_is_utf8(option : Int8*) : Bool
  fun uri_set_auth_mechanism = mongoc_uri_set_auth_mechanism(uri : Uri*, value : Int8*) : Bool
  fun uri_set_auth_source = mongoc_uri_set_auth_source(uri : Uri*, value : Int8*) : Bool
  fun uri_set_compressors = mongoc_uri_set_compressors(uri : Uri*, compressors : Int8*) : Bool
  fun uri_set_database = mongoc_uri_set_database(uri : Uri*, database : Int8*) : Bool
  fun uri_set_mechanism_properties = mongoc_uri_set_mechanism_properties(uri : Uri*, properties : BSON*) : Bool
  fun uri_set_option_as_bool = mongoc_uri_set_option_as_bool(uri : Uri*, option : Int8*, value : Bool) : Bool
  fun uri_set_option_as_int32 = mongoc_uri_set_option_as_int32(uri : Uri*, option : Int8*, value : Int32) : Bool
  fun uri_set_option_as_int64 = mongoc_uri_set_option_as_int64(uri : Uri*, option : Int8*, value : Int64) : Bool
  # fun uri_set_option_as_utf8 = mongoc_uri_set_option_as_utf8(uri : Uri*, option : Int8*, value : utf8) : Bool
  fun uri_set_password = mongoc_uri_set_password(uri : Uri*, password : Int8*) : Bool
  fun uri_set_read_concern = mongoc_uri_set_read_concern(uri : Uri*, rc : ReadConcern*) : Void
  fun uri_set_read_prefs_t = mongoc_uri_set_read_prefs_t(uri : Uri*, prefs : ReadPrefs*) : Void
  fun uri_set_username = mongoc_uri_set_username(uri : Uri*, username : Int8*) : Bool
  fun uri_set_write_concern = mongoc_uri_set_write_concern(uri : Uri*, wc : WriteConcern*) : Void
  fun uri_unescape = mongoc_uri_unescape(escaped_string : Int8*) : Int8*

  ### Version Checks
  fun check_version = mongoc_check_version(required_major : Int32, required_minor : Int32, required_micro : Int32) : Bool
  fun get_major_version = mongoc_get_major_version : Int32
  fun get_micro_version = mongoc_get_micro_version : Int32
  fun get_minor_version = mongoc_get_minor_version : Int32
  fun get_version = mongoc_get_version : Int8*

  ### mongoc_write_concern_t
  type WriteConcern = Void

  fun write_concern_append = mongoc_write_concern_append(write_concern : WriteConcern*, command : BSON*) : Bool
  fun write_concern_copy = mongoc_write_concern_copy(write_concern : WriteConcern*) : WriteConcern*
  fun write_concern_destroy = mongoc_write_concern_destroy(write_concern : WriteConcern*) : Void
  fun write_concern_get_fsync = mongoc_write_concern_get_fsync(write_concern : WriteConcern*) : Bool
  fun write_concern_get_journal = mongoc_write_concern_get_journal(write_concern : WriteConcern*) : Bool
  fun write_concern_get_w = mongoc_write_concern_get_w(write_concern : WriteConcern*) : Int32
  fun write_concern_get_wmajority = mongoc_write_concern_get_wmajority(write_concern : WriteConcern*) : Bool
  fun write_concern_get_wtag = mongoc_write_concern_get_wtag(write_concern : WriteConcern*) : Int8*
  fun write_concern_get_wtimeout = mongoc_write_concern_get_wtimeout(write_concern : WriteConcern*) : Int32
  fun write_concern_get_wtimeout_int64 = mongoc_write_concern_get_wtimeout_int64(write_concern : WriteConcern*) : Int64
  fun write_concern_is_acknowledged = mongoc_write_concern_is_acknowledged(write_concern : WriteConcern*) : Bool
  fun write_concern_is_default = mongoc_write_concern_is_default(write_concern : WriteConcern*) : Bool
  fun write_concern_is_valid = mongoc_write_concern_is_valid(write_concern : WriteConcern*) : Bool
  fun write_concern_journal_is_set = mongoc_write_concern_journal_is_set(write_concern : WriteConcern*) : Bool
  fun write_concern_new = mongoc_write_concern_new : WriteConcern*
  fun write_concern_set_fsync = mongoc_write_concern_set_fsync(write_concern : WriteConcern*, fsync_ : Bool) : Void
  fun write_concern_set_journal = mongoc_write_concern_set_journal(write_concern : WriteConcern*, journal : Bool) : Void
  fun write_concern_set_w = mongoc_write_concern_set_w(write_concern : WriteConcern*, w : Int32) : Void
  fun write_concern_set_wmajority = mongoc_write_concern_set_wmajority(write_concern : WriteConcern*, wtimeout_msec : Int32) : Void
  fun write_concern_set_wtag = mongoc_write_concern_set_wtag(write_concern : WriteConcern*, tag : Int8*) : Void
  fun write_concern_set_wtimeout = mongoc_write_concern_set_wtimeout(write_concern : WriteConcern*, wtimeout_msec : Int32) : Void
  fun write_concern_set_wtimeout_int64 = mongoc_write_concern_set_wtimeout_int64(write_concern : WriteConcern*, wtimeout_msec : Int64) : Void
end