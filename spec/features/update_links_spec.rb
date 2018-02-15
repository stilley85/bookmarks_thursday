feature 'link' do
  scenario 'Updates a links title in the database' do
    visit('/update_link')
    fill_in 'old_link_title', with: "Makers Academy"
    fill_in 'updated_link_title', with: "New Title"
    click_button("Submit_title")
    expect(page).to have_content("New Title")
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
