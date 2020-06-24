class AnimeFinder::CLI 
  
  def call
    puts "\nLet's find you an anime to watch!\n"
    menu
  end
  
  def menu
    input = ""
    
    until input == "exit"
    puts "\nTo search by genre, enter 'genres'.\n"
    puts "To show a list of animes, enter 'animes'."
    puts "Type 'exit' to abandon me."
    input = gets.chomp
    
    case input
      when "genres"
        list_genres
      when "animes"
        list_of_animes
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
    # binding.pry
    
    if input.to_i <= @genres.length
      #list anime that belong to that genre 
      list_of_animes  #giving the entire list 
    else
      puts "Hhmm..I can't seem to find that. Enter a number 1-5 please."
      input = gets.chomp 
    end
      
  end
  
  def anime
    #gets animes from scraper class
    @anime = ["Inuyasha", "Ranma 1/2", "Lovely Complex"]
  end
  
  def list_of_animes
    puts "\n\n"
    anime.each.with_index(1) {|g, i| puts "#{i}. #{g}"}
    puts "Enter number of anime to list of show details."
    input = gets.chomp
  end
  
  def summary
    #displays the description of the show
  end
end