require 'bundler'

Bundler.require
require 'active_record'

require_all 'app'

ActiveRecord::Base.establish_connection({
  :adapter => 'sqlite3',
  :database => "db/development.sqlite"
})