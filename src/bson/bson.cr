require "json"
require "../lib/LibBSON"

alias NumberType = Float32 | Float64 | Int8 | Int16 | Int32 | Int64 |
  UInt8 | UInt16 | UInt32 | UInt64

alias AnyType = Array(AnyType) | Bool | Hash(NumberType | String, AnyType) |
  Nil | NumberType | String

module Mongo
  class BSON
    @ptrBSON : Pointer(LibBSON::BSON)

    def initialize
      @ptrBSON = LibBSON.new_ptr
    end

    def initialize(data : Hash(String, AnyType))
      dataJson : String = data.to_json.to_s
      @ptrBSON = LibBSON.new_from_data dataJson.to_unsafe, dataJson.size.as(LibBSON::SizeT)
    end

    # def initialize(data : String)
    #   @ptrBSON = LibMongoc.new_from_json = bson_new_from_json(data : UInt8*, len : SSizeT, error : Error*) : BSON*
    # end

    # fun LibMongoc.new_from_buffer = bson_new_from_buffer(buf : UInt8**, buf_len : SizeT*, realloc_func : bson_realloc_func, realloc_func_ctx : Void*) : BSON* 

    def finalize
      LibBSON.destroy @ptrBSON
    end

    def to_unsafe : Pointer(LibBSON::BSON)
      @ptrBSON
    end
  end
end
