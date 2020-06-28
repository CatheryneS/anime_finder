class AnimeFinder::Scraper
  
  def self.scrape_genre_list(url)
    
    page = Nokogiri::HTML(open(url))
    list = page.search('ul')[3..3].css('a')
  
    list.collect do |link|
      name = link.text
      url = link.attribute('href').value
      AnimeFinder::Genre.new(name, url)
    end
    
  end
  
  # def self.get_anime_list
  #   genre_url = "https://aniwatcher.com/anime-list"
    
  #   page = Nokogiri::HTML(open(genre_url))
  #   animes = page.css
  #   urls = page.css('div.column').children.css('li').css('a').map {|link| link.attribute('href').value} #returns an array of links
    
  #   links = []
    
  #   urls.each do |link|
  #     url = "https://aniwatcher.com" + link
  #     links << url
  #   end
  #   scrape_info_page(links)
  # end
  
  # def self.scrape_info_page(links)
  #   # scrapes for anime details (title, genre, episodes, year)
  #   #create a hash for each new anime
    
  #   page = Nokogiri::HTML(open(links.to_s))
  #   details = page.css('#series')
  #   anime_details = []
  #   details.each do |detail|
  #     # binding.pry
  #     @anime = detail.search('a').map(&:text)
  #     # anime_details << genres
  #   end
  #   @anime
  # end
  
  def self.scrape_animes(genre)
    page = Nokogiri::HTML(open(genre.url))
    animes = page.css('.blb-title')
    
    animes.map do |link|
      title = link.text 
      detail_page = link.attribute('href').value
      AnimeFinder::Anime.new(title, genre.url, detail_page)
    end
  end
  
  def self.get_details(anime)
    page = Nokogiri::HTML(open(anime.detail_page))
    details = page.css('div.animeDetail-top')
    
    details.collect do |detail|
      binding.pry
  
      synopsis = detail.css('p.anime-details').text.strip
      # genres = detail.css('div:nth-child(2) > a').map(&:text)
      # title = anime.title
      # detail_page = anime.detail_page
      
      AnimeFinder::Anime.add
      binding.pry
      
      
      anime.anime << anime_info
      binding.pry
    end

  end
  
end