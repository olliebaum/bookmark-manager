feature 'Viewing bookmarks' do
  scenario 'displays a list of bookmarks' do
    visit '/bookmarks'
    expect(page).to have_text "Bookmark 1Bookmark 2Bookmark 3"
  end
end
