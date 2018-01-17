require 'bundler'
Bundler.require

require 'open-uri'

DB = {
  :connection => SQLite3::Database.new("db/rooms-development.sqlite")
}

binding.pry
require_all 'lib'
