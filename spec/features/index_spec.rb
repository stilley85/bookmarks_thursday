feature 'link' do
  scenario 'show links in array' do
    visit('/')
    expect(page).to have_content("http://www.google.com")
  end
end