require 'bookmark_manager'

describe BookmarkManager do

  describe '#list_all' do
    it 'returns stored bookmarks' do
      expect(subject.bookmarks).to eq []
    end
  end

  describe '#add' do
    let(:bmark1) { double("bmark1") }
    let(:mock_bmark_class) {double("mock_bmark_class", new: bmark1)}
    subject { BookmarkManager.new(mock_bmark_class) }

    it 'adds new bookmarks to @bookmarks' do
      subject.add("Bookmark 1", "www.bookmark1.com")
      expect(subject.bookmarks).to eq [bmark1]
    end
  end

end
