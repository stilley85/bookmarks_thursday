feature 'link' do
  scenario 'Updates a link in the database' do
    visit('/update_link')
    fill_in 'old_link_title', with: "Makers Academy"
    fill_in 'updated_link_title', with: "New Title"
    click_button("Submit")
    expect(page).to have_content("New Title")
    expect(page).not_to have_content("Makers Academy")
  end
end
