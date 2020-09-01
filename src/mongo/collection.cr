module Mongo
  class Collection
    private @ptrCollection : Pointer(LibMongoc::Collection)

    def initialize(@ptrCollection : Pointer(LibMongoc::Collection))
    end

    def finalize
      LibMongoc.collection_destroy @ptrCollection
    end

    ############################################################################

    getter def name : String
      String.new LibMongoc.collection_get_name @ptrCollection
    end

    getter def readConcern : ReadConcern
      ReadConcern.new LibMongoc.collection_get_read_concern @ptrCollection
    end

    getter def readPrefs : ReadPrefs
      ReadPrefs.new LibMongoc.collection_get_read_prefs @ptrCollection
    end

    getter def writeConcern : WriteConcern
      WriteConcern.new LibMongoc.collection_get_write_concern @ptrCollection
    end

    ############################################################################

    def aggregate(flags : QueryFlags, pipeline : BSON, opts : BSON, read_prefs : ReadPrefs) : Cursor
      Cursor.new LibMongoc.collection_aggregate @ptrCollection, flags, pipeline.to_unsafe, opts.to_unsafe, read_prefs.to_unsafe
    end

    def command(flags : QueryFlags, skip : UInt32, limit : UInt32, batchSize : UInt32, command : BSON, fields : BSON, readPrefs : ReadPrefs) : Cursor
      Cursor.new LibMongoc.collection_command @ptrCollection, flags, skip, limit, batchSize, command.to_unsafe, fields.to_unsafe, read_prefs.to_unsafe
    end

    def command_simple
      # LibMongoc.collection_command_simple @ptrCollection, command : BSON*, read_prefs : ReadPrefs*, reply : BSON*, error : BSON_error*) : Bool
    end

    def command_with_opts
      # LibMongoc.collection_command_with_opts @ptrCollection, command : BSON*, read_prefs : ReadPrefs*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
    end

    def copy : Collection
      Collection.new LibMongoc.collection_copy @ptrCollection
    end

    def count_documents(filter : BSON, opts : BSON, readPrefs : ReadPrefs, reply : BSON) : Int64
      # arg error : BSON_error
      LibMongoc.collection_count_documents @ptrCollection, filter.to_unsafe, opts.to_unsafe, readPrefs.to_unsafe, reply.to_unsafe, error.to_unsafe
    end
    
    def estimated_document_count
      # LibMongoc.collection_estimated_document_count @ptrCollection, opts : BSON*, read_prefs : ReadPrefs*, reply : BSON*, error : BSON_error*) : Int64
    end

    def count
      # LibMongoc.collection_count @ptrCollection, flags : QueryFlags, query : BSON*, skip : Int64, limit : Int64, read_prefs : ReadPrefs*, error : BSON_error*) : Int64 # BSON_GNUC_DEPRECATED_FOR(mongoc_collection_count_documents or mongoc_collection_estimated_document_count)
    end

    def count_with_opts
      #  mongoc_collection_count_with_opts @ptrCollection, flags : QueryFlags, query : BSON*, skip : Int64, limit : Int64, opts : BSON*, read_prefs : ReadPrefs*, error : BSON_error*) : Int64 # BSON_GNUC_DEPRECATED_FOR(mongoc_collection_count_documents or mongoc_collection_estimated_document_count)
    end

    def create_bulk_operation
      # LibMongoc.collection_create_bulk_operation @ptrCollection, ordered : Bool, write_concern : WriteConcern*) : BulkOperation* # BSON_GNUC_WARN_UNUSED_RESULT BSON_GNUC_DEPRECATED_FOR(mongoc_collection_create_bulk_operation_with_opts)
    end

    def create_bulk_operation_with_opts
      # LibMongoc.collection_create_bulk_operation_with_opts @ptrCollection, opts : BSON*) : BulkOperation* # BSON_GNUC_WARN_UNUSED_RESULT
    end

    def create_index
      # LibMongoc.collection_create_index @ptrCollection, keys : BSON*, opt : IndexOpt*, error : BSON_error*) : Bool
    end

    def create_index_with_opts
      # LibMongoc.collection_create_index_with_opts @ptrCollection, keys : BSON*, index_opts : IndexOpt*, command_opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
    end

    def delete
      # BSON_GNUC_DEPRECATED_FOR(mongoc_collection_delete_one or mongoc_collection_delete_many)
      # LibMongoc.collection_delete @ptrCollection, flags : DeleteFlags, selector : BSON*, write_concern : WriteConcern*, error : BSON_error*) : Bool 
    end

    def delete_many
      # LibMongoc.collection_delete_many @ptrCollection, selector : BSON*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
    end

    def delete_one
      # LibMongoc.collection_delete_one @ptrCollection, selector : BSON*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
    end

    def drop? : Bool
      error = BSONError.new
      LibMongoc.collection_drop @ptrCollection, error.to_unsafe
      # TODO: Catch the error
    end

    def drop_index?(indexName : String) : Bool
      error = BSONError.new
      LibMongoc.collection_drop_index @ptrCollection, indexName.to_unsafe, error.to_unsafe
      # TODO: Catch the error
    end

    def drop_index_with_opts?(indexName : String, opts : BSON) : Bool
      error = BSONError.new
      LibMongoc.collection_drop_index_with_opts @ptrCollection, indexName.to_unsafe, opts.to_unsafe, error.to_unsafe
      # TODO: Catch the error
    end

    def drop_with_opts?(opts : BSON) : Bool
      error = BSONError.new
      LibMongoc.collection_drop_with_opts @ptrCollection, opts.to_unsafe, error.to_unsafe
      # TODO: Catch the error
    end

    def ensure_index?(keys : BSON, opt : IndexOpt) : Bool
      # BSON_GNUC_DEPRECATED
      error = BSONError.new
      LibMongoc.collection_ensure_index @ptrCollection, keys.to_unsafe, opt.to_unsafe, error.to_unsafe
      # TODO: Catch the error
    end

    def find(flags : QueryFlags, skip : UInt32, limit : UInt32, batchSize : UInt32, query : BSON, fields : BSON, readPrefs : ReadPrefs) : Cursor
      # BSON_GNUC_DEPRECATED_FOR(mongoc_collection_find_with_opts) BSON_GNUC_WARN_UNUSED_RESULT
      Cursor.new LibMongoc.collection_find @ptrCollection, flags, skip, limit, batchSize, query.to_unsafe, fields.to_unsafe, readPrefs.to_unsafe 
    end

    def find_and_modify
      # LibMongoc.collection_find_and_modify @ptrCollection, query : BSON*, sort : BSON*, update : BSON*, fields : BSON*, _remove : Bool, upsert : Bool, _new : Bool, reply : BSON*, error : BSON_error*) : Bool
    end

    def find_and_modify_with_opts
      # LibMongoc.collection_find_and_modify_with_opts @ptrCollection, query : BSON*, opts : FindAndModifyOpts*, reply : BSON*, error : BSON_error*) : Bool
    end

    def find_indexes
      # LibMongoc.collection_find_indexes @ptrCollection, error : BSON_error*) : Cursor* 
    end

    def find_indexes_with_opts
      # LibMongoc.collection_find_indexes_with_opts @ptrCollection, opts : BSON*) : Cursor*
    end

    def find_with_opts
      # LibMongoc.collection_find_with_opts @ptrCollection, filter : BSON*, opts : BSON*, read_prefs : ReadPrefs*) : Cursor* # BSON_GNUC_WARN_UNUSED_RESULT
    end

    def get_last_error
      # LibMongoc.collection_get_last_error @ptrCollection) : BSON*
    end

    def insert
      # LibMongoc.collection_insert @ptrCollection, flags : InsertFlags, document : BSON*, write_concern : WriteConcern*, error : BSON_error*) : Bool
    end

    def insert_bulk
      # LibMongoc.collection_insert_bulk @ptrCollection, flags : InsertFlags, documents : BSON**, n_documents : UInt32, write_concern : WriteConcern*, error : BSON_error*) : Bool # BSON_GNUC_DEPRECATED_FOR(mongoc_collection_insert_many)
    end

    def insert_many
      # LibMongoc.collection_insert_many @ptrCollection, documents : BSON**, n_documents : SizeT, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
    end

    def insert_one
      # LibMongoc.collection_insert_one @ptrCollection, document : BSON*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
    end

    def keys_to_index_string
      # LibMongoc.collection_keys_to_index_string(keys : BSON*) : Int8*
    end

    def read_command_with_opts
      # LibMongoc.collection_read_command_with_opts @ptrCollection, command : BSON*, read_prefs : ReadPrefs*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
    end

    def read_write_command_with_opts
      # LibMongoc.collection_read_write_command_with_opts @ptrCollection, command : BSON*, read_prefs : ReadPrefs*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
    end

    def remove
      # LibMongoc.collection_remove @ptrCollection, flags : RemoveFlags, selector : BSON*, write_concern : WriteConcern*, error : BSON_error*) : Bool
    end

    def rename
      # LibMongoc.collection_rename @ptrCollection, new_db : Int8*, new_name : Int8*, drop_target_before_rename : Bool, error : BSON_error*) : Bool
    end

    def rename_with_opts
      #  mongoc_collection_rename_with_opts @ptrCollection, new_db : Int8, new_name : Int8, drop_target_before_rename : Bool, opts : BSON*, error : BSON_error*) : Bool
    end

    def replace_one
      # LibMongoc.collection_replace_one @ptrCollection, selector : BSON*, replacement : BSON*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
    end

    def save
      # LibMongoc.collection_save @ptrCollection, document : BSON*, write_concern : WriteConcern*, error : BSON_error*) : Bool # BSON_GNUC_DEPRECATED_FOR(mongoc_collection_insert_one or mongoc_collection_replace_one)
    end

    def set_read_concern
      # LibMongoc.collection_set_read_concern @ptrCollection, read_concern : ReadConcern*) : Void
    end

    def set_read_prefs
      # LibMongoc.collection_set_read_prefs @ptrCollection, read_prefs : ReadPrefs*) : Void
    end

    def set_write_concern
      #  mongoc_collection_set_write_concern @ptrCollection, write_concern : WriteConcern *) : Void
    end

    def stats
      # LibMongoc.collection_stats @ptrCollection, options : BSON*, reply : BSON*, error : BSON_error*) : Bool # BSON_GNUC_DEPRECATED
    end

    def to_unsafe : Pointer(LibMongoc::Collection)
      @ptrCollection
    end

    def update
      # LibMongoc.collection_update @ptrCollection, flags : UpdateFlags, selector : BSON*, update : BSON*, write_concern : WriteConcern*, error : BSON_error*) : Bool
    end

    def update_one
      # LibMongoc.collection_update_one @ptrCollection, selector : BSON*, update : BSON*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
    end

    def update_many
      # LibMongoc.collection_update_many @ptrCollection, selector : BSON*, update : BSON*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
    end

    def validate
      #  mongoc_collection_validate @ptrCollection, options : BSON*, reply : BSON*, error : BSON_error*) : Bool
    end

    def write_command_with_opts
      # LibMongoc.collection_write_command_with_opts @ptrCollection, command : BSON*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
    end
  end
end
