require "../lib/LibMongoc"

module Mongo
  class Collection
    @ptrCollection : Pointer(LibMongoc::Collection)

    def initialize(@ptrCollection : Pointer(LibMongoc::Collection))
    end

    def finalize
      LibMongoc.collection_destroy @ptrCollection
    end

    def find(query : BSON, fields : BSON, flags : QueryFlags, skip : UInt32 = 0,
        limit : UInt32 = 0, batch_size : UInt32 = 0,
        read_prefs : Pointer(ReadPrefs) = nil) : Cursor
      # query : BSON*, fields : BSON*
      Cursor.new LibMongoc.collection_find @ptrCollection, flags , skip, limit, batch_size, query, fields, read_prefs
      # : Cursor* 
      # BSON_GNUC_DEPRECATED_FOR(mongoc_collection_find_with_opts) BSON_GNUC_WARN_UNUSED_RESULT
    end

    def name : String
      String.new LibMongoc.collection_get_name @ptrCollection
    end
  end
end
