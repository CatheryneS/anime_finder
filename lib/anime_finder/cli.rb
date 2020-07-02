class AnimeFinder::CLI 
  
  def call
    puts "\nLet's find you an anime to watch!\n".colorize(:blue)
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
      when "exit"
        puts "Enjoy your binge watching! See you in 72 hours.".colorize(:cyan)
      else 
        puts "\nMaster-sama, I don't know that action. Please try again.\n".colorize(:yellow)
      end
    end
  end
  
  def genres
    @genres = AnimeFinder::Genre.all
  end
  
  def list_genres
    genres.each.with_index(1) {|g, i| puts "#{i}. #{g.name}"}
    puts "\nEnter the number of the genre you're interested in?".colorize(:green)
    genre_selection
  end
  
  def genre_selection
    selection = gets.strip
    if input_check(selection) == true 
      animes_based_on_genre(selection)
    else
      puts "Hhmm..I can't seem to find that.Enter a number from the list please.".colorize(:yellow)
      list_genres
    end
  end
  
  def input_check(selection)
     selection.to_i <= genres.length && selection.to_i > 0
  end
  
  def animes
    @animes = AnimeFinder::Anime.all
  end
  
  def all_animes
    if animes.empty?
      puts "\nNo viewing history.\n".colorize(:red)
    else
      puts "\nPerviously viewed titles.\n".colorize(:light_green)
      animes.each.with_index(1) {|animes, i| puts "#{i}.".colorize(:green) + "#{animes.title}"}
    end
  end
  
  def animes_based_on_genre(input)
    
    genre = genres[input.to_i - 1]
    
    list = AnimeFinder::Scraper.scrape_animes(genre)
    
    list.each.with_index(1) do |anime, i|
      puts "#{i}. #{anime.title}"
    end
    
    puts "\nEnter the number for the anime you want to know more:".colorize(:green)
    anime_selection
  end
  
  def anime_selection
    selection = gets.strip
    if selection.to_i <= animes.length && selection.to_i > 0
      anime_details(selection)
    else
      puts "I don't know that number. Enter a number from the list.".colorize(:yellow)
      anime_selection
    end
  end
  
  
  def anime_details(input)

    anime = animes[input.to_i - 1]
    binding.pry
    details = AnimeFinder::Scraper.get_details(anime)

    # details.each do |d| 
      # binding.pry
      puts "\nTitle:".colorize(:blue) + "#{anime.title}"
      puts "Genres:".colorize(:blue) + "#{anime.genre}"
      puts "Synopsis:".colorize(:blue) + "#{anime.synopsis}"
      puts "\nWatch:".colorize(:blue) + "#{anime.detail_page}"
    # end
  end
end