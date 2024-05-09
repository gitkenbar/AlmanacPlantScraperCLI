require 'nokogiri'
require 'open-uri'
require_relative 'plant'

module Scraper
  def self.scrape_plant(input)
    base_url = 'https://www.almanac.com/plant/'

    begin
      uri_open = URI.open(base_url + input)
      Nokogiri::HTML(uri_open)
    rescue OpenURI::HTTPError => e
      if e.message == '404 Not Found'
        puts "404: I couldn't find that"
        puts 'Try again'
      else
        raise e
      end
    end

    # There is a field for recipes, but it contains links through /recipe/ not /plants/, Future functionality? I think so!
    # There is a field for Photos, I don't think I can display photos in a CLI, but it could be useful for an API
  end
end
