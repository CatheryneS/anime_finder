class AnimeFinder::GenreExpert
  attr_accessor :genre, :anime
  @@all = ["action", "romance", "slice of life", "comdey", "drama"]
  
  # def initialize(genre)
  #   @genre = genre 
  #   save
  # end
  
  # def save
  #   @@all << self
  # end
  
  def self.all 
    # AnimeFinder::Scraper.scrape_genre_list if @@all.empty?
    @@all 
  end
  
  # def add_anime(anime)
  #   anime.genre = self
  # end
  
  # def anime
  #   #returns animes that belong to the genre
  # AnimeFinder::AnimeExpert.all.select {|anime| anime.genre ==self}
  # end
  
  # will know everything about genres 
  # has a 'has many' relationship with AnimeExpert (anime has many genres)
  # belongs to relationship w/AnimeExpert (anime belongs to genres)
  
end