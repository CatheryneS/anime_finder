require_relative "./anime_finder/version"
require_relative "./anime_finder/cli"
require_relative "./anime_finder/anime_expert"
require_relative "./anime_finder/genre_expert"
require_relative "./anime_finder/site_scraper"

require 'pry'
require 'nokogiri'
require 'open-uri'

module AnimeFinder
  class Error < StandardError; end
  # Your code goes here...
end
