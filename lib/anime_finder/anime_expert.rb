class AnimeFinder::Anime
  attr_accessor :genre, :synopsis
  attr_accessor :title, :genre_url, :detail_page
  @@all = []
  
  def initialize(title, genre_url, detail_page)
    @title = title
    @genre_url = genre_url
    @detail_page = detail_page
    @synopsis = synopsis
    @genre = genre
    save
  end
  
  def save
    @@all.push(self)
  end
  
  def self.all
    AnimeFinder::Scraper.get_anime_list if @@all.empty?
    @@all
  end
  
  # def add_genre(genre)
  #   genre.anime = self 
  # end
  
  # def genre 
  #   #returns genres the anime belongs to 
  #   AnimeFinder::Genre.all.select {|genre| genre.anime == self}
  # end
end
