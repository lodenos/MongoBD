require "../lib/LibMongoc"

module Mongo
  class Cursor
    @ptrCursor : Pointer(LibMongoc::Cursor)

    def initialize(@ptrCursor : Pointer(LibMongoc::Cursor))
    end

    def initialize(client : Client, reply : BSON, serverID : UInt32)
      # BSON_GNUC_DEPRECATED_FOR(mongoc_cursor_new_from_command_reply_with_opts)
      @ptrCursor = LibMongoc.cursor_new_from_command_reply client.to_unsafe, reply.to_unsafe, serverID
    end

    def initialize(client : Client, reply : BSON, opts : BSON)
      @ptrCursor = LibMongoc.cursor_new_from_command_reply_with_opts client.to_unsafe, reply.to_unsafe, opts.to_unsafe
    end

    def finalize
      LibMongoc.cursor_destroy @ptrCursor
    end

    ############################################################################

    getter def batchSize : UInt32
      LibMongoc.cursor_get_batch_size @ptrCursor
    end

    setter def batchSize(value : UInt32)
      LibMongoc.cursor_set_batch_size @ptrCursor, value
    end

    getter def hint : UInt32
      LibMongoc.cursor_get_hint @ptrCursor
    end

    setter def hint(serverID : UInt32)
      LibMongoc.cursor_set_hint @ptrCursor, serverID
      # TODO: Catch Bool return
    end

    # getter def host : 
      # LibMongoc.cursor_get_host @ptrCursor, host : HostList*
    # end

    getter def id : Int64
      LibMongoc.cursor_get_id @ptrCursor
    end

    getter def limit : Int64
      LibMongoc.cursor_get_limit @ptrCursor
    end

    setter def limit(value : Int64)
      LibMongoc.mongoc_cursor_set_limit @ptrCursor, value
      # TODO: Catch Bool return
    end

    getter def maxAwaitTimeMs : UInt32
      LibMongoc.cursor_get_max_await_time_ms @ptrCursor
    end

    setter def maxAwaitTimeMs(value : UInt32)
      LibMongoc.cursor_set_max_await_time_ms @ptrCursor, value
    end

    ############################################################################

    def alive? : Bool
      # BSON_GNUC_DEPRECATED_FOR(mongoc_cursor_more)
      LibMongoc.cursor_is_alive @ptrCursor 
    end

    def clone : Cursor
      # BSON_GNUC_WARN_UNUSED_RESULT
      Cursor.new LibMongoc.cursor_clone @ptrCursor
    end

    def current : BSON
      BSON.new LibMongoc.cursor_current @ptrCursor
    end

    def error
      # LibMongoc.cursor_error(cursor : Cursor*, error : BSON_error*) : Bool
    end

    def error_document
      # LibMongoc.cursor_error_document(cursor : Cursor*, error : BSON*, reply : BSON**) : Bool
    end

    def more? : Bool
      LibMongoc.cursor_more @ptrCursor
    end

    # def next? : Bool
      # LibMongoc.cursor_next @ptrCursor, bson : BSON**) : Bool
    # end

    def to_unsafe : Pointer(LibMongoc::Cursor)
      @ptrCursor
    end
  end
end
