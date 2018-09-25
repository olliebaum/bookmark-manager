feature 'Viewing bookmarks' do
  scenario 'displays empty array when no bookmarks added' do
    visit '/bookmarks'
    expect(page).to have_content "[]"
  end
  scenario 'displays list of bookmarks when bookmarks are added' do
    visit '/'
    click_button('Add')
    fill_in 'title', with: "Bookmark 1"
    fill_in 'url', with: "https://www.google.com/"
    click_button('Add')
    expect(page).to have_content("Bookmark 1")
  end
end
