require "rspec/core/rake_task"
require "pry"
require "sinatra/activerecord/rake"
require_relative "./lib/activerecord_associations"

desc "starts a console"
task :console do 
  Pry.start
end

desc "chinook console" 
task :chinook do 
  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'db/ar_chinook.sqlite'
  )
  Pry.start
end

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
