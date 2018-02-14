require 'link'

describe Link do

  context '#all' do
    it 'has a list of links' do
      links = Link.all
      expect(links).to include("http://www.google.com")
      expect(links).to include("http://www.facebook.com")
      expect(links).to include("http://www.makersacademy.com")
    end
  end

  context '#add_link' do
    it 'can add a link to the database' do
      Link.add_link("https://www.bbc.co.uk")
      expect(Link.all).to include("https://www.bbc.co.uk")
    end

    it 'raises an error when given an invalid link' do
      expect{Link.add_link("your mum")}.to raise_error("invalid link has been entered")
    end
  end
end