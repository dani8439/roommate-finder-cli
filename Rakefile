require_relative './config/environment'


def reload!
  load_all './lib'
end

task :console do
  Pry.start
end

task :scrape_rooms do
  # instantiate a scraper, and then have it find new rooms
  RoomScraper.new().update_rooms
  # after this method call, i should be able to say Room.all and have rooms there.
end
