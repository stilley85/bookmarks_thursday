require './lib/databaseconnection'

task :setup do
  require 'pg'

  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup("bookmark_manager_test")
    DatabaseConnection.query("TRUNCATE links")
    DatabaseConnection.query("INSERT INTO links VALUES(1, 'http://www.makersacademy.com')")
    DatabaseConnection.query("INSERT INTO links VALUES(2, 'http://www.google.com')")
    DatabaseConnection.query("INSERT INTO links VALUES(3, 'http://www.facebook.com')")
  else
    DatabaseConnection.setup("bookmark_manager")
    DatabaseConnection.query("TRUNCATE links")
    DatabaseConnection.query("INSERT INTO links VALUES(1, 'http://www.makersacademy.com')")
    DatabaseConnection.query("INSERT INTO links VALUES(2, 'http://www.google.com')")
    DatabaseConnection.query("INSERT INTO links VALUES(3, 'http://www.facebook.com')")
    DatabaseConnection.query("INSERT INTO links VALUES(4, 'http://www.livedb.com')")
  end
end
