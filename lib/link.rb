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

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM links WHERE id = '#{id}'")
  end

  def self.update(id, options)
      DatabaseConnection.query("UPDATE links SET url = '#{options[:url]}', title = '#{options[:title]}' WHERE id = '#{id}'")
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM links WHERE id = #{id}")
    result.map { |link| Link.new(link['id'], link['url'], link['title']) }.first
  end

  private

  def self.working_url?(link)
    link =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
  end

end
