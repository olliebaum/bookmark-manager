require 'bookmark_manager'

describe BookmarkManager do
  let(:bmark1) { double("bmark1") }
  let(:mock_bmark_class) {double("mock_bmark_class", new: bmark1)}
  subject { BookmarkManager.new(mock_bmark_class) }

  describe '#list_all' do
    it 'returns stored bookmarks' do
      expect(subject.bookmarks).to eq []
    end
  end

  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://makers.tech');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")


      bookmarks = BookmarkManager.new.all

      expect(bookmarks).to include "http://makers.tech"
      expect(bookmarks).to include "http://www.destroyallsoftware.com"
      expect(bookmarks).to include "http://www.google.com"
    end
  end

  describe '#add' do
    it 'adds new bookmarks to @bookmarks' do
      subject.add("Bookmark 1", "www.bookmark1.com")
      expect(subject.bookmarks).to eq [bmark1]
    end
  end

end
