

class BookmarkManager
  attr_reader :bookmarks
  def initialize(bookmark_class = Bookmark)
    @bookmarks = []
    @bookmark_class = bookmark_class
  end

  def add(title, url)
    @bookmarks << @bookmark_class.new(title, url)
  end

  def list_all
    list = []
    @bookmarks.each {|bm|
      list << "#{bm.title}: #{bm.url}"
    }
    list
  end
end
