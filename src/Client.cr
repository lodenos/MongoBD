require "uri"

module Mongo
  class Client
    def initialize(uri : String)
    end

    def initialize(uri : URI)
    end
  end
end
