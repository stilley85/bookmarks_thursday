feature 'link' do
  scenario 'show links in array' do
    visit('/')
    expect(page).to have_link("Google", href: 'http://www.google.com')
  end
end
