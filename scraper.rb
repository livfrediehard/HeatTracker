
require_relative "./heat_tracker/scraper"
require_relative "./heat_tracker/tracker"
require 'pry'
require 'nokogiri'
require 'open-uri'
require 'httparty'
require 'byebug'

#scraper method used on Heat site
class HeatScraper
puts "Running Scraper"
def scraper
    url = "https://www.nba.com/heat/roster"
    page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(page)
    player_info = Array.new
    player_lists = parsed_page.css('div.roster__player')
    player_lists.each do |player_list|
        player = {
            name: player_list.css('h2.roster__player__header__heading').text,
            position: player_list.css('div.roster__player__header_position').text,
            number: player_list.css('div.roster__player__header_jnumber').text,

        }
        player_info << player
    end
    byebug
 end
scraper
