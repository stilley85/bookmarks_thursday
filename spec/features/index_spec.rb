feature 'link' do
  scenario 'show links in array' do
    visit('/')
    expect(page).to have_content("www.google.co.uk")
  end
end