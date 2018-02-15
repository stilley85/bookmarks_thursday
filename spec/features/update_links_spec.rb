feature 'link' do
  scenario 'Updates a links title in the database' do
    visit('/update_link/1')
    fill_in 'url', with: "http://www.apple.com"
    fill_in 'title', with: "apple"
    click_button("Submit")
    expect(page).to have_content("apple")
    expect(page).not_to have_content("Makers Academy")
  end

  scenario 'Updates a links url in the database' do
    visit('/update_link')
    fill_in 'old_link_url', with: "http://www.facebook.com"
    fill_in 'updated_link_url', with: "http://www.youtube.com"
    click_button("Submit_url")
    expect(page).not_to have_link("Facebook", href: "http://www.facebook.com")
    expect(page).to have_link("Facebook", href: "http://www.youtube.com")
  end
end
