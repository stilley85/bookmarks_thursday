require 'pg'

class DatabaseConnection

  attr_reader :database

  def self.instance
    @database
  end

  def self.setup(database_name)
    @database = PG.connect(dbname: "#{database_name}")
  end

  def self.query(sql)
    @database.exec(sql)
  end

end
