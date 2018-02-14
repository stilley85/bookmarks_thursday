require 'pg'
require './lib/databaseconnection'

class Link

  def self.all
    DatabaseConnection.query("SELECT * FROM links").map { |link| link['url'] }
  end

  def self.add_link(link)
    DatabaseConnection.query("INSERT INTO links(url) VALUES('#{link}')")
  end
end