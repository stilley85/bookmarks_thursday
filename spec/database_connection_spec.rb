require 'databaseconnection'

describe DatabaseConnection do

  describe 'setup' do
    it 'connects to the database passed in as the argument' do
      expect(PG).to receive(:connect).with(dbname: "bookmark_manager_test")
      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  describe 'query' do
    it 'translates the code and inputs into correct database' do
      connection = DatabaseConnection.setup("bookmark_manager_test")
      expect(connection).to receive(:exec).with("SELECT * FROM links")
      DatabaseConnection.query("SELECT * FROM links")
    end
  end
end