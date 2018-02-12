require 'link'

describe Link do

  context '#all'
    it 'has a list of links' do
      links = Link.all
      expect(links).to include("www.google.co.uk")
  end
end