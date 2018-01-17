class Room
  attr_accessor :title, :date_created, :price, :url

  def self.create_from_hash(hash) #Instantiate and save
    new_from_hash(hash).save
    # delegates to new_from_hash(a class method)
    # save is being called on an instance
  end

  def self.new_from_hash(hash) #Just instantiating
    room = self.new
    room.title = hash[:title]
    room.date_created = hash[:date_created]
    room.price = hash[:price]
    room.url = hash[:url]
    room
  end

  def save
    # I need a database!!
    puts "YOU ARE ABOUT TO SAVE #{self}"
    sql = <<-SQL
      INSERT INTO rooms (title, date_created, price, url) VALUES (?, ?, ?, ?)
    SQL
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS rooms (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        date_created DATETIME,
        price TEXT,
        url TEXT
      )
    SQL

    DB[:connection].execute(sql)
  end
end
