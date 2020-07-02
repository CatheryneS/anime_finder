require_relative "./anime_finder/version"
require_relative "./anime_finder/cli"
require_relative "./anime_finder/anime_expert"
require_relative "./anime_finder/genre_expert"
require_relative "./anime_finder/site_scraper"
# require_relative "./anime_finder/anime_links"

require 'pry'
require 'nokogiri'
require 'open-uri'
require 'colorize'

module AnimeFinder
  class Error < StandardError; end
  # Your code goes here...
end
