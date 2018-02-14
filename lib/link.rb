require 'pg'
require './lib/databaseconnection'
require 'uri'

class Link

  def self.all
    DatabaseConnection.query("SELECT * FROM links").map { |link| link['url'] }
  end

  def self.add_link(link)
    raise("invalid link has been entered") if working_url?(link) == nil
    DatabaseConnection.query("INSERT INTO links(url) VALUES('#{link}')")
  end
end


private

def working_url?(link)
  link =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
end
