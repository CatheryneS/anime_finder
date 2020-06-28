class AnimeFinder::Genre
  attr_accessor :name, :url, :links, :anime
  @@all = []
  
  def initialize(name, url)
    @name = name 
    @url = url
    @anime = []
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
end