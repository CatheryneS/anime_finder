class AnimeFinder::CLI 
  
  def call
    puts "\nLet's find you an anime to watch!\n"
    menu
  end
  
  def menu
    input = ""
    
    until input == "exit"
    puts "\nTo search by genre, enter 'genres'.\n"
    puts "To show the titles of animes you've searched already, enter 'animes'."
    puts "Type 'exit' to abandon me."
    input = gets.strip.downcase
    
    case input
      when "genres"
        list_genres
      when "animes"
        all_animes
        menu
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
      @trigger = selection
    else
      list_genres
      puts "Hhmm..I can't seem to find that.Enter a number from the list please."
    end
  end
  
  def input_check(selection)
     selection.to_i <= genres.length && selection.to_i > 0
  end
  
  def animes
    @animes = AnimeFinder::Anime.all
  end
  
  def all_animes
      puts "\nPerviously viewed titles.\n"
      animes.each.with_index(1) {|animes, i| puts "#{i}.#{animes.title}"}
  end
  
  def animes_based_on_genre(input)
    
    genre = genres[input.to_i - 1]
    
    list = AnimeFinder::Scraper.scrape_animes(genre)
    
    list.each.with_index(1) do |anime, i|
      puts "#{i}. #{anime.title}"
    end
    
    puts "\nEnter the number for the anime you want to know more:\n"
    anime_selection
  end
  
  def anime_selection
    selection = gets.strip
    if selection.to_i <= AnimeFinder::Links.all.length && selection.to_i > 0
      @remember = anime_details(selection)
    else
      animes_based_on_genre(@trigger)
    end
  end
  
  def return_menu
    input = ""
    
    until input == "exit"
    puts "\nReturn to anime list, enter 'back'.\n"
    puts "To show the titles of animes you've searched already, enter 'animes'."
    puts "To search a new genre, enter 'genre'."
    puts "Type 'exit' to abandon me."
    input = gets.strip.downcase
    
    case input
      when "genres"
        list_genres
      when "animes"
        all_animes
      when "back"
        animes_based_on_genre(@remember)
      when "exit"
        menu
      else 
        puts "\nMaster-sama, I don't know that action. Please try again.\n"
      end
    end
  end
  
  def anime_details(input)
    anime = AnimeFinder::Links.all[input.to_i - 1]
    details = AnimeFinder::Scraper.get_details(anime)

    details.each do |d| 
      puts "Title: #{d.title}"
      puts "Genres/Season: #{d.genre}"
      puts "Synopsis: #{d.synopsis}"
      puts "To watch: #{d.detail_page}"
    end
    return_menu
  end
end