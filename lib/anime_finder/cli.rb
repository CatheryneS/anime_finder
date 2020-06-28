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
    input = gets.strip.downcase
    
    case input
      when "genres"
        list_genres
      when "animes"
        all_animes
      when "exit"
        puts "Enjoy your binge watching! See you in 72 hours."
      else 
        puts "\nMaster-sama, I don't know that action. Please try again.\n"
      end
    end
  end
  
  def genres
    @genres = AnimeFinder::Genre.all
  end
  
  def list_genres
    genres.each.with_index(1) {|g, i| puts "#{i}. #{g.name}"}
    puts "\nEnter the number of the genre you're interested in?\n"
    genre_selection
  end
  
  def genre_selection
    selection = gets.strip
    if input_check(selection) == true 
      animes_based_on_genre(selection)
    else
      list_genres
      puts "Hhmm..I can't seem to find that.bin Enter a number from the list please."
    end
  end
  
  def input_check(selection)
     selection.to_i <= (genres.length || animes.length) && selection.to_i > 0
  end
  
  def animes
    @animes = AnimeFinder::Anime.all
  end
  
  def all_animes
    # @animes = AnimeFinder::Anime.all
    puts "\nEnter number of anime to list of show details.\n"
    animes.each.with_index(1) {|animes, i| puts "#{i}.#{animes.title}"}
    input = gets.strip
  end
  
  def links
    
  end
  
  def animes_based_on_genre(input)
    # lists the animes based on input from list_genres 
    # binding.pry
    genre = genres[input.to_i - 1]
    # binding.pry
    list = AnimeFinder::Scraper.scrape_animes(genre)
    # binding.pry
    list.each.with_index(1) do |anime, i|
      puts "#{i}. #{anime.title}"
    end
    
    puts "\nEnter the number for the anime you want to know more:\n"
    anime_selection
  end
  
  def anime_selection
    selection = gets.strip
    if input_check(selection) == true 
      anime_details(selection)
    else
      puts "Hhmm..I can't seem to find that. Enter a number from the list please."
      animes_based_on_genre
    end
  end
  
  def anime_details(input)
    #displays the description, title, genre, episodes, year
    #getting from AnimeExpert class
    #needs to know anime based on user input of a number / how to get it to be based off name
    anime = @animes[input.to_i - 1]

    AnimeFinder::Scraper.get_details(anime)
    puts "Trying to load details"
  end
end