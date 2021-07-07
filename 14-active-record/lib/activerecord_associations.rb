require "require_all"
require "sinatra/activerecord"
ActiveRecord::Base.logger = Logger.new(STDOUT)
require_all "./lib/activerecord_associations"

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3', 
  database: 'db/ar_chinook.sqlite'
)

module ActiverecordAssociations
  class Error < StandardError; end
  # Your code goes here...
end
