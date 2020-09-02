module Mongo
  class ReadConcern
    @ptrReadConcern : Pointer(LibMongoc::ReadConcern)

    def initialize
      @ptrReadConcern = LibMongoc.read_concern_new
    end

    def finalize
      LibMongoc.read_concern_destroy @ptrReadConcern
    end

    getter def level : String
      String.new LibMongoc.mongoc_read_concern_get_level @ptrReadConcern
    end

    setter def level(value : String)
      LibMongoc.read_concern_set_level @ptrReadConcern, value.to_unsafe
      # TODO catch the Bool return
    end

    def append(opts : BSON) # Maybe use the operator <<
      LibMongoc.read_concern_append @ptrReadConcern, opts.to_unsafe
      # TODO catch the Bool return
    end

    def copy : ReadConcern
      ReadConcern.new LibMongoc.read_concern_copy @ptrReadConcern
    end

    def default? : Bool
      LibMongoc.read_concern_is_default @ptrReadConcern
    end

    def to_unsafe : Pointer(LibMongoc::ReadConcern)
      @ptrReadConcern
    end
  end
end
