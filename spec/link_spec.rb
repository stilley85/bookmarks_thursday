require 'link'

describe Link do

  context '#all'
    it 'has a list of links' do
      links = Link.all
      expect(links).to include("http://www.google.com")
      expect(links).to include("http://www.facebook.com")
      expect(links).to include("http://www.makersacademy.com")
  end
end