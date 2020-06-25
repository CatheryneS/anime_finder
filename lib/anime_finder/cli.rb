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
        puts "\nMaster-sama, I don't know that action. Please try again.\n"
      end
    end
  end
  
  def genres
    AnimeFinder::GenreExpert.new("action")
    AnimeFinder::GenreExpert.new("slice of life")
    @genres = AnimeFinder::GenreExpert.all
  end
  
  def list_genres
    puts "\nEnter the number of the genre you're interested in?\n"
    genres.each.with_index(1) {|g, i| puts "#{i}. #{g.name}"}
    selection
  end
  
  def selection
    selection = gets.chomp
    if input_check(selection) == true 
      animes_based_on_genre(selection)
    else
      puts "Hhmm..I can't seem to find that. Enter a number from the list please."
      list_genres
    end
  end
  
  def input_check(selection)
     selection.to_i <= genres.length && selection.to_i > 0
  end
  
  def animes
    
    @animes = AnimeFinder::AnimeExpert.all
  end
  
  def list_of_animes
    puts "\n\n"
    animes.each.with_index(1) {|title, i| puts "#{i}. #{title}"}
    puts "Enter number of anime to list of show details."
    input = gets.chomp
  end
  
  def animes_based_on_genre(selection)
    # lists the animes based on input from list_genres 
    
    list = animes[selection.to_i - 1]
    # list.each.with_index(1) do |anime, i|
    #   puts "#{i}. #{anime}"
    # end
    puts "\nEnter the number for the anime you want to know more:\n"
    
  end
  
  def anime_details
    #displays the description, title, genre, episodes, year
    #getting from AnimeExpert class
    #needs to know anime based on user input of a number / how to get it to be based off name
    puts "Trying to load details"
  end
end