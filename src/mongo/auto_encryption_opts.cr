module Mongo
  class AutoEncryptionOpts 
    @ptrAutoEncryptionOpts : Pointer(LibMongoc::AutoEncryptionOpts)

    def initialize
      @ptrAutoEncryptionOpts = LibMongoc.auto_encryption_opts_new
    end

    def initialize(@ptrAutoEncryptionOpts : Pointer(LibMongoc::AutoEncryptionOpts))
    end

    def finalize
      LibMongoc.auto_encryption_opts_destroy  @ptrAutoEncryptionOpts
    end

    setter def keyvault_client(client : Client)
      LibMongoc.auto_encryption_opts_set_keyvault_client @ptrAutoEncryptionOpts, client.to_unsafe
    end

    setter def keyvault_client_pool
      LibMongoc.auto_encryption_opts_set_keyvault_client_pool @ptrAutoEncryptionOpts, pool : ClientPool*) : Void
    end

    setter def keyvault_namespace
      LibMongoc.auto_encryption_opts_set_keyvault_namespace @ptrAutoEncryptionOpts, db : Int8*, coll : Int8*) : Void
    end

    setter def kms_providers
      LibMongoc.auto_encryption_opts_set_kms_providers @ptrAutoEncryptionOpts, kms_providers : BSON*) : Void
    end

    setter def schema_map = mongoc_auto_encryption_opts_set_schema_map @ptrAutoEncryptionOpts, schema_map : BSON*) : Void
    end
    
    setter def bypass_auto_encryption = mongoc_auto_encryption_opts_set_bypass_auto_encryption @ptrAutoEncryptionOpts, bypass_auto_encryption : Bool) : Void
    end
    
    setter def extra = mongoc_auto_encryption_opts_set_extra @ptrAutoEncryptionOpts, extra : BSON*) : Void
    end
  end
end