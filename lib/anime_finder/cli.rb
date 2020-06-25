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
    @genres
  end
  
  def list_genres
    puts "\nEnter the number of the genre you're interested in?\n"
    AnimeFinder::GenreExpert.all.each.with_index(1) {|g, i| puts "#{i}. #{g}"}
    selection = gets.chomp.to_i
    
    if selection - 1 <= AnimeFinder::GenreExpert.all.length && selection >= 0
      #list anime that belong to that genre
      animes_based_on_genre(selection)
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
    
    list = @anime[selection - 1]
    list.each.with_index(1) do |anime, i|
      puts "#{i}. #{anime}"
    end
    puts "\nEnter the number for the anime you want to know more:\n"
  end
  
  def anime_details
    #displays the description, title, genre, episodes, year
    #getting from AnimeExpert class
    #needs to know anime based on user input of a number / how to get it to be based off name
    AnimeFinder::AnimeExpert.new 
  end
end