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
    picked_genre = gets.chomp
    
    if picked_genre.to_i <= @genres.length && picked_genre.to_i < 0
      #list anime that belong to that genre 
    else
      puts "Hhmm..I can't seem to find that. Enter a number from the list please."
      genre_pick = gets.chomp 
    end
      
  end
  
  def anime
    #gets animes from scraper class
    @anime = ["Inuyasha", "Ranma 1/2", "Lovely Complex"]
  end
  
  def list_of_animes
    puts "\n\n"
    anime.each.with_index(1) {|title, i| puts "#{i}. #{title}"}
    puts "Enter number of anime to list of show details."
    input = gets.chomp
  end
  
  def animes_based_on_genre(picked_genre)
    # lists the animes based on input from list_genres 
    list = @anime[picked_genre - 1]
  end
  
  def anime_details
    #displays the description, title, genre, episodes, year
    #getting from AnimeExpert class
    AnimeFinder::AnimeExpert.new 
  end
end