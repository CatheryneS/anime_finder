class AnimeFinder::Scraper
  
  def self.scrape_genre_list 
    #scrapes for an array of genres
    # iterate through genre array to make list of genres with numbers? Here or AnimeExpert
    genre_url = "https://aniwatcher.com/anime-list"
    
    page = Nokogiri::HTML(open(genre_url))
    genres = page.css("#genrecheck").text.strip
    binding.pry
    genres.split(/   /) #returns an array 
  end
  
  def self.get_anime_list
    
  end
  
  def scrape_info_page
    # scrapes for anime details (title, genre, episodes, year)
    #create a hash for each new anime
  end
end