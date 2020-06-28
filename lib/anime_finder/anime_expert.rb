class AnimeFinder::Anime
  attr_accessor :title, :genres, :episodes, :synopsis, :year, :url
  @@all = []
  
  def initialize(title, url)
    # anime_hash.each do |key, value|
    #   self.send(("#{key}="), value)
    # end
    
    @title = title
    @url = url
    # @genres = []
    save
  end
  
  def save
    @@all.push(self)
  end
  
  def self.all
    AnimeFinder::Scraper.get_anime_list if @@all.empty?
    @@all
  end
  
  def add_genre(genre)
    genre.anime = self 
  end
  
  def genre 
    #returns genres the anime belongs to 
    AnimeFinder::Genre.all.select {|genre| genre.anime == self}
  end
end
