require "./lib/LibMongoc"

module Mongo
  class Client
    @ptrClient : Pointer(LibMongoc::Client)

    def initialize(addresses : String | URI, options = nil)
      @ptrClient = LibMongoc.client_new addresses
      case addresses
      when String
        @ptrClient = LibMongoc.client_new addresses
      when URI
        @ptrClient = LibMongoc.client_new_from_uri addresses
      end
    end

    def [](database : String) : Database
      Database.new LibMongoc.client_get_database @ptrClient, database
    end

    def finalize
      LibMongoc.client_destroy @ptrClient
    end
  end
end
