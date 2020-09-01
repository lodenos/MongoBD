module Mongo
  class ReadPrefs
    @ptrReadPrefs : Pointer(LibMongoc::ReadPrefs)

    def initialize(@ptrReadPrefs : Pointer(LibMongoc::ReadPrefs))
    end

    def initialize(readMode : ReadMode)
      @ptrReadPrefs = LibMongoc.read_prefs_new readMode
    end

    def finalize
      LibMongoc.read_prefs_destroy @ptrReadPrefs
    end

    getter def maxStalenessSeconds : Int64
      LibMongoc.read_prefs_get_max_staleness_seconds @ptrReadPrefs
    end

    setter def maxStalenessSeconds(value : Int64)
      LibMongoc.read_prefs_set_max_staleness_seconds @ptrReadPrefs, value
    end

    getter def mode : ReadMode
      LibMongoc.read_prefs_get_mode @ptrReadPrefs
    end

    setter def mode(value : ReadMode)
      LibMongoc.read_prefs_set_mode @ptrReadPrefs, value
    end

    getter def tags : BSON
      BSON.new LibMongoc.read_prefs_get_tags @ptrReadPrefs
    end

    setter def tags(value : BSON)
      LibMongoc.read_prefs_set_tags @ptrReadPrefs, tags.to_unsafe
    end

    def add_tag(tag : BSON)
      LibMongoc.read_prefs_add_tag @ptrReadPrefs, tag.to_unsafe
    end

    def copy : ReadPrefs
      ReadPrefs.new LibMongoc.read_prefs_copy @ptrReadPrefs
    end

    def valid? : Bool
      LibMongoc.read_prefs_is_valid @ptrReadPrefs
    end
  end
end
