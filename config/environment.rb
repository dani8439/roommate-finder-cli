require 'bundler'
Bundler.require

require 'open-uri'

DB = {
  :connection => SQLite3::Database.new("db/rooms-development.sqlite")
}

require_all 'lib'
