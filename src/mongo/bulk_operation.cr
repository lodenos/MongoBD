module Mongo
  class BulkOperation
    @ptrBulkOperation : Pointer(LibMongoc::BulkOperation)

    def initialize(@ptrBulkOperation : Pointer(LibMongoc::BulkOperation))
    end

    # fun collection_create_bulk_operation = mongoc_collection_create_bulk_operation(collection : Collection*, ordered : Bool, write_concern : WriteConcern*) : BulkOperation* # BSON_GNUC_WARN_UNUSED_RESULT BSON_GNUC_DEPRECATED_FOR(mongoc_collection_create_bulk_operation_with_opts)
    # fun collection_create_bulk_operation_with_opts = mongoc_collection_create_bulk_operation_with_opts(collection : Collection*, opts : BSON*) : BulkOperation* # BSON_GNUC_WARN_UNUSED_RESULT

    def delete(selector : BSON) : Void
      LibMongoc.bulk_operation_delete @ptrBulkOperation, selector.to_unsafe
    end

    def delete_one(selector : BSON) : Void
      LibMongoc.bulk_operation_delete_one @ptrBulkOperation, selector.to_unsafe
    end

    def destroy : Void
      LibMongoc.bulk_operation_destroy @ptrBulkOperation
    end

    def execute(reply : BSON) : UInt32
      # LibMongoc.bulk_operation_execute @ptrBulkOperation, reply.to_unsafe, error : BSON_error*
    end

    def hint : UInt32
      LibMongoc.bulk_operation_get_hint @ptrBulkOperation
    end

    def writeConcern : WriteConcern
      WriteConcern.new LibMongoc.bulk_operation_get_write_concern @ptrBulkOperation
    end

    def insert(document : BSON) : Void
      LibMongoc.bulk_operation_insert @ptrBulkOperation, document.to_unsafe
    end

    def insert_with_opts(document : BSON, opts : BSON) : Bool
      # LibMongoc.bulk_operation_insert_with_opts @ptrBulkOperation, document.to_unsafe, opts.to_unsafe, error : BSON_error*) : Bool
    end

    def remove(selector : BSON) : Void
      LibMongoc.bulk_operation_remove @ptrBulkOperation, selector.to_unsafe
    end

    def remove_many_with_opts(selector : BSON, opts : BSON) : Bool
      # LibMongoc.bulk_operation_remove_many_with_opts @ptrBulkOperation, selector.to_unsafe, opts : to_unsafe, error : BSON_error*) : Bool
    end

    def remove_one(selector : BSON) : Void
      LibMongoc.bulk_operation_remove_one @ptrBulkOperation, selector.to_unsafe
    end

    def remove_one_with_opts(selector : BSON, opts : BSON) : Bool
      # LibMongoc.bulk_operation_remove_one_with_opts @ptrBulkOperation, selector.to_unsafe, opts.to_unsafe, error : BSON_error*) : Bool
    end

    def replace_one(selector : BSON, document : BSON, upsert : Bool) : Void
      LibMongoc.bulk_operation_replace_one @ptrBulkOperation, selector.to_unsafe, document.to_unsafe, upsert
    end

    def replace_one_with_opts(selector : BSON, document : BSON, opts : BSON)
      # LibMongoc.bulk_operation_replace_one_with_opts @ptrBulkOperation, selector.to_unsafe, document.to_unsafe, opts.to_unsafe, error : BSON_error*) : Bool
    end

    def bypassDocumentValidation=(value : Bool) : Void
      LibMongoc.bulk_operation_set_bypass_document_validation @ptrBulkOperation, value
    end

    def clientSession=(value : ClientSession) : Void
      LibMongoc.bulk_operation_set_client_session @ptrBulkOperation, value.to_unsafe
    end

    def hint=(serverId : UInt32) : Void
      LibMongoc.bulk_operation_set_hint @ptrBulkOperation, serverId
    end

    def update(selector : BSON, document : BSON, upsert : Bool) : Void
      LibMongoc.bulk_operation_update @ptrBulkOperation, selector.to_unsafe, document.to_unsafe, upsert
    end

    def update_many_with_opts(selector : BSON, document : BSON, opts : BSON) : Void
      # LibMongoc.bulk_operation_update_many_with_opts @ptrBulkOperation, selector.to_unsafe, document.to_unsafe, opts.to_unsafe, error : BSON_error*) : Bool
    end

    def update_one(selector : BSON, document : BSON, upsert : Bool) : Void
      LibMongoc.bulk_operation_update_one @ptrBulkOperation, selector.to_unsafe, document.to_unsafe, upsert
    end

    def update_one_with_opts(selector : BSON, document : BSON, opts : BSON)
      # LibMongoc.bulk_operation_update_one_with_opts @ptrBulkOperation, selector : BSON*, document : BSON*, opts : BSON*, error : BSON_error*) : Bool
    end
  end
end
