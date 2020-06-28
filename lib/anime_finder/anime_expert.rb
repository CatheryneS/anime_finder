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
