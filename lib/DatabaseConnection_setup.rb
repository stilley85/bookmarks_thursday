p "Setting up database to connect"

require 'pg'
require './lib/databaseconnection'

if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup("bookmark_manager_test")
else
    DatabaseConnection.setup("bookmark_manager")
end