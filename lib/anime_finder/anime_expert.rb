class AnimeFinder::Anime
  attr_reader :genre, :synopsis, :links, :title, :genre_url, :detail_page, :anime
  @@all = []
  
  # def initialize(title, synopsis, genre, detail_page)
  #   @title = title
  #   @synopsis =synopsis
  #   @genre = genre
  #   @detail_page = detail_page
  #   save
  # end
  def initialize(title, detail_page)
    @title = title
    @detail_page = detail_page
    @genre = []
    @synopsis = ""
    save
  end
  # def initialize(attributes)
  #   attributes.each {|key, value| self.send(("#{key}="), value)}
  # end
  
  def save
    @@all.push(self)
  end
  
  def self.all
    @@all
  end
  def add_details(genres)
    binding.pry
    @genre << genres
    genres.anime = self 
  end
end
