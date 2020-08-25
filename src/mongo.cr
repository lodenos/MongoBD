require "./client"
require "./collection"
require "./database"
require "./lib/LibMongoc"
require "./uri"

module Mongo; end

uri = "mongodb://localhost:27017"

client = Mongo::Client.new uri

db = client["DB"]
collection = db["test"]

puts collection.name