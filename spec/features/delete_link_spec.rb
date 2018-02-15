require 'sinatra/flash'

feature 'link' do
  scenario 'Deletes a link from the database' do
    visit('/delete_link')
    fill_in 'delete_link_title', with: "Makers Academy"
    click_button("Submit")
    expect(page).not_to have_content("Makers Academy")
  end

  # scenario 'The link must be a valid URL' do
  #   visit('/add_new_link')
  #   fill_in('new_link', with: 'not a real link')
  #   click_button('Submit')
  #
  #   expect(page).not_to have_content "not a real link"
  #   expect(page).to have_content "You must submit a valid URL."
  # end
end
