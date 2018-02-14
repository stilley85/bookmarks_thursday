require 'pg'
require './lib/databaseconnection'
require 'uri'

class Link

  def self.all
    DatabaseConnection.query("SELECT * FROM links").map { |link| link['url'] }
  end

  def self.add_link(link)
    return false unless working_url?(link)
    DatabaseConnection.query("INSERT INTO links(url) VALUES('#{link}')")
  end
end


private

def working_url?(link)
  link =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
end
