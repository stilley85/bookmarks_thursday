require 'pg'
require './lib/databaseconnection'
require 'uri'

class Link

  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    db = DatabaseConnection.query("SELECT * FROM links")
    db.map { |link| Link.new(link['id'], link['url'], link['title']) }

  end

  def self.add_link(link, title)
    return false unless working_url?(link)
    DatabaseConnection.query("INSERT INTO links(url, title) VALUES('#{link}', '#{title}')")
  end

  def self.delete(title)
    DatabaseConnection.query("DELETE FROM links WHERE title = '#{title}'")
  end

  private

  def self.working_url?(link)
    link =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
  end

end
