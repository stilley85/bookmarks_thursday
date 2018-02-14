require 'sinatra/flash'

feature 'link' do
  scenario 'adds a new link to the database' do
    visit('/add_new_link')
    fill_in 'new_link', with: "http://www.new_link.com"
    click_button("Submit")
    expect(page).to have_content("http://www.new_link.com")
  end

  scenario 'The link must be a valid URL' do
    visit('/add_new_link')
    fill_in('new_link', with: 'not a real link')
    click_button('Submit')

    expect(page).not_to have_content "not a real link"
    expect(page).to have_content "You must submit a valid URL."
  end
end