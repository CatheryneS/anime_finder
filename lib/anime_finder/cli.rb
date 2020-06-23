class AnimeFinder::CLI 
  
  def call
    input = ""
    
    until input == "exit"
    puts "\nLet's find you an anime to watch!\n"
    puts "\nTo start with a genre, enter 'genres'.\n"
    input = gets.chomp
    # list_genres
    # list_of_animes
    # show catagorizes
    # ask which on they want to look into 
    # provide a list of matching anime
    # user picks an anime 
    # anime summary is given
    
    case input
      when "genres"
        list_genres
      when "exit"
        puts "Enjoy your binge watching! See you in 72 hours."
      else 
        puts "\nI don't get it. Please try again.\n"
      end
    end
  end
  
  def genres
    #gets genres from scraper class
    @genres = ["action", "romance", "slice of life"] # test data 
  end
  
  def list_genres
    puts "\nEnter the number of the genre you're interested in?\n"
    genres.each.with_index(1) {|g, i| puts "#{i}. #{g}"}
    input = gets.chomp
    
      # case input
      #   when input == index 
      #     list_of_animes
      #   else
      #     "\nPlease use a number of 1-5.\n"
      #   end
  end
  
  def anime
    #gets animes from scraper class
    @anime = ["Inuyasha", "Ranma 1/2", "Lovely Complex"]
  end
  
  def list_of_animes
    anime.each.with_index(1) {|g, i| puts "#{i}. #{g}"}
  end
  
  def summary
    #displays the description of the show
  end
end