require "./client"
require "./collection"
require "./database"
require "../lib/LibMongoc"
require "./uri"

module Mongo; end

uri = "mongodb://localhost:27017"

client = Mongo::Client.new uri

db = client["DB"]
collection = db["test"]
puts collection.name
collection.insert({ "name" => "James Bond", "age" => 37 })
collection.find({ "age" => { "$gt" => 30 } }) do |document|
  puts document
end
