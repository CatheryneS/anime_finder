class AnimeFinder::Genre
  attr_accessor :name
  attr_reader :anime, :url 
  @@all = []
  
  def initialize(name, url)
    @name = name
    @url = url
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all 
    url = "https://www.animefreak.tv/home/genres"
    AnimeFinder::Scraper.scrape_genre_list(url) if @@all.empty?
    @@all
  end
  
  def add_anime_title
    anime.genre = self
  end
  
  # def anime
  #   #returns animes that belong to the genre
  #   # AnimeFinder::AnimeExpert.all.select {|anime| anime.genre ==self}
  # end
  
  # will know everything about genres 
  # has a 'has many' relationship with AnimeExpert (anime has many genres)
  # belongs to relationship w/AnimeExpert (anime belongs to genres)
  
end