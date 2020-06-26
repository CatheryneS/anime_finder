class AnimeFinder::Anime
  attr_accessor :title, :genre, :episodes, :summary, :year  
  @@all = []
  
  def initialize(title)
    # anime_hash.each do |key, value|
    #   self.send(("#{key}="), value)
    # end
    @title = title
    @genres = []
    save
  end
  
  def save
    @@all.push(self)
  end
  
  def self.all
    # AnimeFinder::Scraper
    @@all
  end
  
  def add_genre(genre)
    genre.anime = self 
  end
  
  def genre 
    #returns genres the anime belongs to 
    AnimeFinder::GenreExpert.all.select {|genre| genre.anime == self}
  end
end
