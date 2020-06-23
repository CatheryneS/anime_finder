class AnimeFinder::CLI 
  def call
    puts "Let's find you an anime to watch!"
    genres
    list_genres
    # show catagorizes
    # ask which on they want to look into 
    # provide a list of matching anime
    # user picks an anime 
    # anime summary is given 
  end
  
  def genres
    #gets genres from scraper
    @genres = ["action", "romance", "slice of life"] # test data 
  end
  
  def list_genres
    @genres.each.with_index(1) {|g, i| puts "#{i}. #{g}"}
  end
  
  def anime_list
    
  end
  
  def summary
    
  end
end