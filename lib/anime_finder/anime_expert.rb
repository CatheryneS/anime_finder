class AnimeFinder::Anime
  attr_reader :genre, :synopsis, :links, :title, :genre_url, :detail_page
  @@all = []
  
  def initialize(title, synopsis, genre, detail_page)
    @title = title
    @synopsis =synopsis
    @genre = genre
    @detail_page = detail_page
    save
  end
  
  def save
    @@all.push(self)
  end
  
  def self.all
    @@all
  end
end
