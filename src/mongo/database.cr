require "../lib/LibMongoc"

module Mongo
  class Database
    @ptrDatabase : Pointer(LibMongoc::Database)

    def initialize(@ptrDatabase : Pointer(LibMongoc::Database))
    end

    def finalize
      LibMongoc.database_destroy @ptrDatabase
    end

    def [](collection : String)
      Collection.new LibMongoc.database_get_collection @ptrDatabase, collection
    end

    def name : String
      String.new LibMongoc.database_get_name @ptrDatabase
    end
  end
end
