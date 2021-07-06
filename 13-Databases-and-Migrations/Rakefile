require "rspec/core/rake_task"
require "sinatra/activerecord/rake"
ActiveRecord::Base.establish_connection(
    adapter: "sqlite3",
    database: "db/intro_to_activerecord.sqlite"
)

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
