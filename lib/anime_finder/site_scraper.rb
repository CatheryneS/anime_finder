class AnimeFinder::Scraper
  
  def self.scrape_genre_list(url)
    
    page = Nokogiri::HTML(open(url))
    list = page.search('ul')[3..3].css('a')
  
    list.collect do |link|
      name = link.text
      url = link.attribute('href').value
      AnimeFinder::Genre.new(name, url)
      # binding.pry
    end
  end
  
  def self.scrape_animes(genre)
    page = Nokogiri::HTML(open(genre.url))
    animes = page.css('.blb-title')

    animes.map do |link|
      title = link.text 
      detail_page = link.attribute('href').value
      # binding.pry
      AnimeFinder::Anime.new(title, detail_page)
      # AnimeFinder::Links.new(title, genre.url, detail_page)
      # binding.pry
    end
  end
  
  def self.get_details(anime)
    page = Nokogiri::HTML(open(anime.detail_page))
    details = page.css('div.animeDetail-top')
    
    details.collect do |detail|
  
      summary = detail.css('p.anime-details').text.strip
      genres = detail.css('div:nth-child(2) > a').map(&:text)
      title = anime.title
      detail_page = anime.detail_page

      anime.genre << genres
      anime.synopsis << summary
      # binding.pry
      anime.anime_history(anime)
      # anime.add_details(genres)
      # AnimeFinder::Anime.new(title, synopsis, genres, detail_page)
      
    end
  end
  
end