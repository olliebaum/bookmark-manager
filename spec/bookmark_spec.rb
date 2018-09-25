require 'bookmark'

describe Bookmark do
  subject {Bookmark.new("Example","http://www.example.com")}

  it 'initializes with a given url' do
    expect(subject.title).to eq "Example"
  end

  it 'initializes with a given url' do
    expect(subject.url).to eq "http://www.example.com"
  end

end
