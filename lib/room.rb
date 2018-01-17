class Room
  attr_accessor :title, :date_created, :price, :url

  def self.create_from_hash(hash)
    new_from_hash(hash).save
    # delegates to new_from_hash(a class method)
    # save is being called on an instance
  end

  def self.new_from_hash(hash)
    room = self.new
    room.title = hash[:title]
    room.date_created = hash[:date_created]
    room.price = hash[:price]
    room.url = hash[:url]
    room
  end

  def save
    puts "YOU ARE ABOUT TO SAVE #{self}"
  end
end
