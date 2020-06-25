class AnimeFinder::Scraper
  
  def scrape_genre_list 
    #scrapes for an array of genres
    # iterate through genre array to make list of genres with numbers? Here or AnimeExpert
    crunchyroll = "https://www.crunchyroll.com/videos/anime/genres"
    
    page = Nokogiri::HTML(open(crunchyroll))
    binding.pry 
    # = page.css(".roster-cards-container")
  end
  
  def scrape_info_page
    # scrapes for anime details (title, genre, episodes, year)
    #create a hash for each new anime
  end
end