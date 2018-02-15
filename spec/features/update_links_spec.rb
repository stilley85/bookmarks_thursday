feature 'link' do
  scenario 'Updates a links title in the database' do
    visit('/update_link/1')
    fill_in 'url', with: "http://www.apple.com"
    fill_in 'title', with: "apple"
    click_button("Submit")
    expect(page).to have_content("apple")
    expect(page).not_to have_content("Makers Academy")
  end
end
