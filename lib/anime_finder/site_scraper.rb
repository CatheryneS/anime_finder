class AnimeFinder::Scraper
  
  def self.scrape_genre_list 
    genre_url = "https://aniwatcher.com/anime-list"
    
    page = Nokogiri::HTML(open(genre_url))
    genres = page.css("div.genre").text.strip.split(/   /)
  
    genres.each do |g| 
      name = g
      AnimeFinder::Genre.new(name)
    end
    
  end
  
  def self.get_anime_list
    
  end
  
  def scrape_info_page
    # scrapes for anime details (title, genre, episodes, year)
    #create a hash for each new anime
  end
end