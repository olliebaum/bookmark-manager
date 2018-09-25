require 'pg'

feature 'Viewing bookmarks' do
  scenario 'displays empty array when no bookmarks added' do
    visit '/bookmarks'
    expect(page).to have_content "[]"
  end

  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
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
