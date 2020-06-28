class AnimeFinder::Links 
  attr_accessor :title, :genre_url, :detail_page
  @@all = []
  
  def initialize(title, genre_url, detail_page)
    @title = title
    @genre_url = genre_url
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