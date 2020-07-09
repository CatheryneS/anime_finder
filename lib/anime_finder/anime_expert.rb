class AnimeFinder::Anime
  attr_reader :genre, :synopsis, :links, :title, :genre_url, :detail_page
  @@all = []
  @@anime_history =[]

  def initialize(title, detail_page)
    @title = title
    @detail_page = detail_page
    @genre = []
    @synopsis = ""
    save
  end
  
  def save
    @@all.push(self)
  end
  
  def self.all
    @@all
  end
  def anime_history(anime)
    @@anime_history << anime
  end

  def self.history
    @@anime_history
  end

  def self.get_anime_list(genre)
    AnimeFinder::Scraper.scrape_animes(genre)
  end
  
  def self.get_details(anime)
    AnimeFinder::Scraper.get_details(anime)
  end

end
