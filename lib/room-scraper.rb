class RoomScraper

  def initialize(index_url)
    @doc = Nokogiri::HTML(open(index_url))
    binding.pry
  end

  def call
    rows.each do |row_doc|
      scrape_row(row_doc)
    end
  end

private

  def rows
    @rows ||= @doc.search("div.content span.rows p.row")
    # or equals operator
    # @does_not_exist = 1
    # @does_not_exist = @does_not_exist || 2
    # ruby will return whatever value made this statement true
    # @another_var ||= "Whatever"
  end

  def scrape_row(row)
    # Scrape an individual row
    {
    :date_created => row.search("time"),
    :title => row.search("a.hdrlnk").text,
    :url => row.search("a.hdrlnk").attribute("href"),
    :price => row.search("span.price").text,
    }
  end
end

# [time, time, time]
# [title, title, title]
# [url, url]
#
# [
#   [time, title, url]
# ]
