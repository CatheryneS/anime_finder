class AnimeFinder::AnimeExpert
  attr_accessor :name, :genre, :episodes, :summary, :year  
  @@all = ["Inuyasha", "Ranma 1/2", "Lovely Complex"]
  
  def initialize(anime_hash)
    anime_hash.each do |key, value|
      self.send(("#{key}="), value)
    end
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
    GenreExpert.all.select {|genre| genre.anime == self}
  end
end
