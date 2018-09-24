feature 'Hello world' do
  scenario 'it displays hello world' do
    visit '/'
    expect(page).to have_content("Hello world")
  end
end
