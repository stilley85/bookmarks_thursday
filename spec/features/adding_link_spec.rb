feature 'link' do
  scenario 'adds a new link to the database' do
    visit('/add_new_link')
    fill_in 'new_link', with: "www.new_link.com"
    click_button("Submit")
    expect(page).to have_content("www.new_link.com")
  end
end