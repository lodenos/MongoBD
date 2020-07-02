require "./lib/LibMongoc"

module Mongodb
  VERSION = "0.1.0"
end

LibMongoc.init
client = LibMongoc.client_new "mongodb://127.0.0.1:27017"

puts client

LibMongoc.client_destroy client
LibMongoc.cleanup