module Mongo
  class BSON
    @ptrBSON : Pointer(LibMongoc::BSON)

    def initialize
      @ptrBSON = LibMongoc.new_ptr
    end


    # fun LibMongoc.new_from_buffer = bson_new_from_buffer(buf : UInt8**, buf_len : SizeT*, realloc_func : bson_realloc_func, realloc_func_ctx : Void*) : BSON* 
    # fun LibMongoc.new_from_data = bson_new_from_data(data : UInt8*, length : SizeT) : BSON*
    # fun LibMongoc.new_from_json = bson_new_from_json(data : UInt8*, len : SSizeT, error : Error*) : BSON*

    def finalize
      LibMongoc.destroy @ptrBSON
    end

    def to_unsafe : Pointer(LibMongoc::BSON)
      @ptrBSON
    end
  end
end
