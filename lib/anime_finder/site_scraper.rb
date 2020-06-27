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
    genre_url = "https://aniwatcher.com/anime-list"
    
    page = Nokogiri::HTML(open(genre_url))
    animes = page.css
    urls = page.css('div.column').children.css('li').css('a').map {|link| link.attribute('href').value} #returns an array of links
    
    links = []
    
    urls.each do |link|
      url = "https://aniwatcher.com" + link
      links << url
    end
    scrape_info_page(links)
  end
  
  def self.scrape_info_page(links)
    # scrapes for anime details (title, genre, episodes, year)
    #create a hash for each new anime
    
    page = Nokogiri::HTML(open(links.to_s))
    details = page.css('#series')
    
    details.each do |detail|
      binding.pry
      genres = detail.search('a').map(&:text)
      
    end
      
      
      
      
      
  end
end