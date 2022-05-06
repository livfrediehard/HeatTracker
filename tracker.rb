require_relative "./heat_tracker/scraper"
require 'pry'
require 'nokogiri'
require 'open-uri'
require 'httparty'
require 'byebug'

class Player
    def initialize(attributes)
      attributes.each do |key, value|
        self.class.attr_accessor(key)
        self.send(("#{key}="), value)
      end
    end
  end