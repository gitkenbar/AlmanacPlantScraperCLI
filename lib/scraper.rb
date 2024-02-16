require 'nokogiri'
require 'open-uri'
require_relative 'plant'

module Scraper


  def self.scrape_plant(input)
    index_url = 'https://www.almanac.com/plant/'
    Nokogiri::HTML(URI.open(index_url + input))
    # plant_info is my original field that grabbed the whole page
    # plant_info = doc.css('.field--type-text-long').text

    # There is a field for recipes, but it contains links through /recipe/ not /plants/, Future functionality? I think so!
    # There is a field for Photos, I don't think I can display photos in a CLI, but it could be useful for an API
  end
end
