require "../lib/LibMongoc"

module Mongo
  # A single-threaded MongoDB connection. See Connection Pooling.
  # 
  # Synopsis
  # typedef struct _mongoc_client_t mongoc_client_t;
  # 
  # typedef mongoc_stream_t *(*mongoc_stream_initiator_t) (
  #    const mongoc_uri_t *uri,
  #    const mongoc_host_list_t *host,
  #    void *user_data,
  #    bson_error_t *error);
  # mongoc_client_t is an opaque type that provides access to a MongoDB server, replica set, or sharded cluster. It maintains management of underlying sockets and routing to individual nodes based on mongoc_read_prefs_t or mongoc_write_concern_t.
  # 
  # Streams
  # The underlying transport for a given client can be customized, wrapped or replaced by any implementation that fulfills mongoc_stream_t. A custom transport can be set with mongoc_client_set_stream_initiator().
  # 
  # Thread Safety
  # mongoc_client_t is NOT thread-safe and should only be used from one thread at a time. When used in multi-threaded scenarios, it is recommended that you use the thread-safe mongoc_client_pool_t to retrieve a mongoc_client_t for your thread.
  # 
  # Example
  # example-client.c
  # /* gcc example-client.c -o example-client $(pkg-config --cflags --libs
  #  * libmongoc-1.0) */
  # 
  # /* ./example-client [CONNECTION_STRING [COLLECTION_NAME]] */
  # 
  # #include <mongoc/mongoc.h>
  # #include <stdio.h>
  # #include <stdlib.h>
  # 
  # int
  # main (int argc, char *argv[])
  # {
  #    mongoc_client_t *client;
  #    mongoc_collection_t *collection;
  #    mongoc_cursor_t *cursor;
  #    bson_error_t error;
  #    const bson_t *doc;
  #    const char *collection_name = "test";
  #    bson_t query;
  #    char *str;
  #    const char *uri_string = "mongodb://127.0.0.1/?appname=client-example";
  #    mongoc_uri_t *uri;
  # 
  #    mongoc_init ();
  #    if (argc > 1) {
  #       uri_string = argv[1];
  #    }
  # 
  #    if (argc > 2) {
  #       collection_name = argv[2];
  #    }
  # 
  #    uri = mongoc_uri_new_with_error (uri_string, &error);
  #    if (!uri) {
  #       fprintf (stderr,
  #                "failed to parse URI: %s\n"
  #                "error message:       %s\n",
  #                uri_string,
  #                error.message);
  #       return EXIT_FAILURE;
  #    }
  # 
  #    client = mongoc_client_new_from_uri (uri);
  #    if (!client) {
  #       return EXIT_FAILURE;
  #    }
  # 
  #    mongoc_client_set_error_api (client, 2);
  # 
  #    bson_init (&query);
  #    collection = mongoc_client_get_collection (client, "test", collection_name);
  #    cursor = mongoc_collection_find_with_opts (
  #       collection,
  #       &query,
  #       NULL,  /* additional options */
  #       NULL); /* read prefs, NULL for default */
  # 
  #    while (mongoc_cursor_next (cursor, &doc)) {
  #       str = bson_as_canonical_extended_json (doc, NULL);
  #       fprintf (stdout, "%s\n", str);
  #       bson_free (str);
  #    }
  # 
  #    if (mongoc_cursor_error (cursor, &error)) {
  #       fprintf (stderr, "Cursor Failure: %s\n", error.message);
  #       return EXIT_FAILURE;
  #    }
  # 
  #    bson_destroy (&query);
  #    mongoc_cursor_destroy (cursor);
  #    mongoc_collection_destroy (collection);
  #    mongoc_uri_destroy (uri);
  #    mongoc_client_destroy (client);
  #    mongoc_cleanup ();
  # 
  #    return EXIT_SUCCESS;
  # }
  class Client
    @ptrClient : Pointer(LibMongoc::Client)

    def initialize(address : String)
      @ptrClient = LibMongoc.client_new address.to_unsafe
    end

    def initialize(uri : Uri)
      @ptrClient = LibMongoc.client_new_from_uri uri.to_unsafe
    end

    def finalize
      LibMongoc.client_destroy @ptrClient
    end

    # http://mongoc.org/libmongoc/1.17.0/mongoc_client_command.html
    def command(db : String, query : BSON)
      Cursor.new LibMongoc.client_command @ptrClient, db.to_unsafe, LibMongoC::QueryFlags::NONE, 0, 0, 0, query.to_unsafe, nil, nil
    end

    # http://mongoc.org/libmongoc/1.17.0/mongoc_client_command.html
    def command(dbName : String, query : BSON, readPrefs : ReadPrefs)
    end

    # http://mongoc.org/libmongoc/1.17.0/mongoc_client_command.html
    def command(dbName : String, flags : QueryFlags, skip : UInt32, limit : UInt32, batchSize : UInt32, query : BSON*, fields : BSON*, read_prefs : ReadPrefs*) : Cursor
      Cursor.new LibMongoc.client_command @ptrClient, dbName.to_unsafe, flags : QueryFlags, skip : UInt32, limit : UInt32, batchSize : UInt32, query : BSON*, fields : BSON*, read_prefs : ReadPrefs*
    end

    def command_simple(dbName : String, command : BSON, readPrefs : ReadPrefs, reply : BSON)
      # LibMongoc.client_command_simple @ptrClient, dbName.to_unsafe, command.to_unsafe, readPrefs.to_unsafe, reply.to_unsafe, error : BSON_error*) : Bool
    end

    def command_simple_with_server_id
      # LibMongoc.client_command_simple_with_server_id @ptrClient, db_name : Int8*, command : BSON*, read_prefs : ReadPrefs*, server_id : UInt32, reply : BSON*, error : BSON_error*) : Bool
    end

    def command_with_opts
      # LibMongoc.client_command_with_opts @ptrClient, db_name : Int8*, command : BSON*, read_prefs : ReadPrefs*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
    end

    def enable_auto_encryption
      # LibMongoc.client_enable_auto_encryption @ptrClient, opts : AutoEncryptionOpts* , error : BSON_error*) : Bool
    end

    def find_databases_with_opts(opts : BSON) : Cursor
      Cursor.new LibMongoc.client_find_databases_with_opts @ptrClient, opts.to_unsafe
    end

    # Get a newly allocated collection for the collection named collection in the database named db.
    def collection(dbName : String, collection : String) : Collection
      Collection.new LibMongoc.client_get_collection @ptrClient, dbName.to_unsafe, collection.to_unsafe
    end

    # def [] is def database ...
    def [](dbName : String) : Database
      Database.new LibMongoc.client_get_database @ptrClient, dbName.to_unsafe
    end

    def database(dbName : String) : Database
      Database.new LibMongoc.client_get_database @ptrClient, dbName.to_unsafe
    end

    # def databaseNames
    #   LibMongoc.client_get_database_names @ptrClient, error : BSON_error*) : Int8**
    # end

    # def databaseNamesWithOpts
    #   LibMongoc.client_get_database_names_with_opts @ptrClient, opts : BSON*, error : BSON_error*) : Int8**
    # end

    def defaultDatabase : Database
      Database.new LibMongoc.client_get_default_database @ptrClient
    end

    def gridfs(dbName : String, prefix : String) : Gridfs
      # Gridfs.new LibMongoc.client_get_gridfs @ptrClient, dbName.to_unsafe, prefix.to_unsafe, error : BSON_error*
    end

    def maxBsonSize : Int32
      LibMongoc.client_get_max_bson_size @ptrClient
    end

    def maxMessageSize : Int32
      LibMongoc.client_get_max_message_size @ptrClient
    end

    def readConcern : ReadConcern
      ReadConcern.new LibMongoc.client_get_read_concern @ptrClient
    end

    def readPrefs : ReadPrefs
      ReadPrefs.new LibMongoc.client_get_read_prefs @ptrClient
    end

    def server_description(serverId : UInt32) : ServerDescription
      ServerDescription.new LibMongoc.client_get_server_description @ptrClient, serverId
    end

    # def get_server_descriptions
    #   LibMongoc.client_get_server_descriptions @ptrClient, n : SizeT*) : ServerDescription**
    # end

    # def get_server_status
    #   LibMongoc.client_get_server_status @ptrClient, read_prefs : ReadPrefs*, reply : BSON*, error : BSON_error*) : Bool # BSON_GNUC_DEPRECATED
    # end

    def uri : Uri*
      Uri.new LibMongoc.client_get_uri @ptrClient
    end

    def writeConcern : WriteConcern
      WriteConcern.new client_get_write_concern @ptrClient
    end

    # def read_command_with_opts(dbName : String, command : BSON, readPrefs : ReadPrefs, opts : BSON, reply : BSON)
    #   LibMongoc.client_read_command_with_opts @ptrClient, dbName : Int8*, command : BSON*, read_prefs : ReadPrefs*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
    # end

    def read_write_command_with_opts
      # LibMongoc.client_read_write_command_with_opts @ptrClient, db_name : Int8*, command : BSON*, read_prefs : ReadPrefs*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
    end

    def reset : Void
      LibMongoc.client_reset @ptrClient
    end

    def select_server
      # LibMongoc.client_select_server @ptrClient, for_writes : Bool, prefs : ReadPrefs*, error : BSON_error*) : ServerDescription*
    end

    # def apmCallbacks=
    #   LibMongoc.client_set_apm_callbacks @ptrClient, callbacks : ApmCallbacks*, context : Void*) : Bool
    # end

    def appname=(value : String) : Void
      LibMongoc.client_set_appname @ptrClient, appname.to_unsafe
      # TODO : Catch Bool
    end

    def errorAPI=(version : Int32)
      # mongoc_client_set_error_api @ptrClient, version : Int32) : Bool
    end

    def readConcern
      # mongoc_client_set_read_concern @ptrClient, read_concern : ReadConcern*) : Void
    end

    def readPrefs
      # mongoc_client_set_read_prefs @ptrClient, read_prefs : ReadPrefs*) : Void
    end
    #ifdef MONGOC_ENABLE_SSL
    # void mongoc_client_set_ssl_opts(mongoc_client_t *client, const mongoc_ssl_opt_t *opts)
    #endif
    # fun client_set_stream_initiator = mongoc_client_set_stream_initiator @ptrClient, initiator : StreamInitiator, user_data : Void*) : Void
    
    def writeConcern=(value : WriteConcern) : Void
      LibMongoc.client_set_write_concern @ptrClient, value.to_unsafe
    end

    def start_session
      # LibMongoc.client_start_session @ptrClient, opts : SessionOpt*, error : BSON_error*) : ClientSession*
    end

    def to_unsafe : Pointer(LibMongoc::Client)
      @ptrClientend
    end

    def watch
      # LibMongoc.client_watch @ptrClient, pipeline : BSON*, opts : BSON*) : ChangeStream*
    end

    def write_command_with_opts
      # LibMongoc.client_write_command_with_opts @ptrClient, db_name : Int8*, command : BSON*, opts : BSON*, reply : BSON*, error : BSON_error*) : Bool
    end
  end
end
