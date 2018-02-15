require 'link'

describe Link do

  context '.all' do
    it 'has a list of links' do
      links = Link.all
      urls = links.map(&:url)
      expect(urls).to include("http://www.facebook.com")
      expect(urls).to include("http://www.makersacademy.com")
      expect(urls).to include("http://www.google.com")
    end

    it 'has a list of titles' do
      links = Link.all
      titles = links.map(&:title)
      expect(titles).to include("Facebook")
      expect(titles).to include("Makers Academy")
      expect(titles).to include("Google")
    end

  end

  context '.add_link' do
    it 'can add a link to the database' do
      Link.add_link("https://www.bbc.co.uk", "BBC")
      links = Link.all
      urls = links.map(&:url)
      expect(urls).to include("https://www.bbc.co.uk")
    end

    it 'raises an error when given an invalid link' do
      Link.add_link("your mum", "your dad")
      expect(Link.all).not_to include "not a real link"
    end
  end

  context '.delete' do
    it "can delete rows from the database" do
      Link.delete(1)
      links = Link.all
      titles = links.map(&:title)
      expect(titles).not_to include("Makers Academy")
    end
  end

  context '.update' do
    it "can update titles in the database" do
      Link.update(1, url: "http://www.youtube.com", title: 'Youtube')
      links = Link.all
      urls = links.map(&:url)
      titles = links.map(&:title)

      expect(urls).not_to include("http://www.makersacademy.com")
      expect(titles).not_to include("Makers Academy")
      expect(urls).to include("http://www.youtube.com")
      expect(titles).to include("Youtube")
    end
  end

  context ".find" do
    it 'finds a link' do
      link = Link.find(1)

      expect(link.url).to eq "http://www.makersacademy.com"
      expect(link.title).to eq("Makers Academy")
    end
  end
end
