class AnimeFinder::GenreExpert
  attr_accessor :genre, :anime
  @@all = []
  
  def initialize(genre)
    @genre = genre 
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all 
    @@all 
  end
  
  def add_anime(anime)
    @anime << anime
    anime.genre = self
  end
  
  def anime
    #returns animes that belong to the genre
    AnimeExpert.all.select {|anime| anime.genre ==self}
  end
  
  # will know everything about genres 
  # has a 'has many' relationship with AnimeExpert (anime has many genres)
  # belongs to relationship w/AnimeExpert (anime belongs to genres)
  
end