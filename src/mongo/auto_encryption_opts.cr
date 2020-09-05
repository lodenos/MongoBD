module Mongo
  class AutoEncryptionOpts 
    @ptrAutoEncryptionOpts : Pointer(LibMongoc::AutoEncryptionOpts)

    def initialize
      @ptrAutoEncryptionOpts = LibMongoc.auto_encryption_opts_new
    end

    def initialize(@ptrAutoEncryptionOpts : Pointer(LibMongoc::AutoEncryptionOpts))
    end

    def finalize
      LibMongoc.auto_encryption_opts_destroy @ptrAutoEncryptionOpts
    end

    def keyvaultClient=(client : Client)
      LibMongoc.auto_encryption_opts_set_keyvault_client @ptrAutoEncryptionOpts, client.to_unsafe
    end


    def keyvaultClientPool=(pool : ClientPool)
      LibMongoc.auto_encryption_opts_set_keyvault_client_pool @ptrAutoEncryptionOpts, pool.to_unsafe
    end

    # def keyvaultNamespace=(db : String, coll : String)
      # LibMongoc.auto_encryption_opts_set_keyvault_namespace @ptrAutoEncryptionOpts, db.to_unsafe, coll.to_unsafe
    # end

    def kmsProviders=(kmsProviders : BSON)
      LibMongoc.auto_encryption_opts_set_kms_providers @ptrAutoEncryptionOpts, kmsProviders.to_unsafe
    end

    def schemaMap=(value : BSON)
      LibMongoc.auto_encryption_opts_set_schema_map @ptrAutoEncryptionOpts, value.to_unsafe
    end

    def bypassAutoEncryption=(value : Bool)
      LibMongoc.auto_encryption_opts_set_bypass_auto_encryption @ptrAutoEncryptionOpts, value
    end

    def extra=(value : BSON)
      LibMongoc.auto_encryption_opts_set_extra @ptrAutoEncryptionOpts, value.to_unsafe
    end

    def to_unsafe : Pointer(LibMongoc::AutoEncryptionOpts)
      @ptrAutoEncryptionOpts
    end
  end
end
