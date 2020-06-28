class AnimeFinder::Links 
  attr_accessor :genre, :synopsis
  attr_accessor :title, :genre_url, :detail_page
  @@all = []
  
  def initialize(title, genre_url, detail_page)
    @title = title
    @genre_url = genre_url
    save
  end
  
  def save
    @@all.push(self)
  end
  
  def self.all
    @@all
  end
  
end