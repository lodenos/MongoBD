module Mongo
  class TransactionOpt
    @ptrTransactionOpt : Pointer(LibMongoc::TransactionOpt)

    def initialize
      @ptrTransactionOpt = LibMongoc.transaction_opts_new
    end

    def initialize(@ptrTransactionOpt : Pointer(LibMongoc::TransactionOpt))
      @ptrTransactionOpt = LibMongoc.transaction_opts_new
    end

    def finalize
      LibMongoc.transaction_opts_destroy @ptrTransactionOpt
    end

    def readConcern : ReadConcern
      ReadConcern.new LibMongoc.transaction_opts_get_read_concern @ptrTransactionOpt
    end

    def readConcern=(value : ReadConcern)
      LibMongoc.transaction_opts_set_read_concern @ptrTransactionOpt, value
    end

    def writeConcern : WriteConcern
      WriteConcern.new LibMongoc.transaction_opts_get_write_concern @ptrTransactionOpt
    end

    def writeConcern=(value : WriteConcern)
      LibMongoc.transaction_opts_set_write_concern @ptrTransactionOpt, value
    end

    def readPrefs : ReadPrefs
      ReadPrefs.new LibMongoc.transaction_opts_get_read_prefs @ptrTransactionOpt 
    end

    def readPrefs=(value : ReadPrefs)
      LibMongoc.transaction_opts_set_read_prefs @ptrTransactionOpt, value
    end

    def maxCommitTimeMs : Int64
      LibMongoc.transaction_opts_get_max_commit_time_ms @ptrTransactionOpt
    end

    def maxCommitTimeMs=(value : Int64)
      LibMongoc.transaction_opts_set_max_commit_time_ms @ptrTransactionOpt, value
    end

    def clone : TransactionOpt
      TransactionOpt.new LibMongoc.transaction_opts_clone @ptrTransactionOpt
    end

    def to_unsafe : Pointer(LibMongoc::TransactionOpt)
      @ptrTransactionOpt
    end
  end
end
