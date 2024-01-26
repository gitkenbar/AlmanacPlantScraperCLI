require 'nokogiri'
require 'open-uri'
require_relative 'plant'

module Scraper
  INDEX_URL = 'https://www.almanac.com/plant/'
  def self.scrape_vegetable(input)
    Plant.clear
    system('clear')
    doc = Nokogiri::HTML(URI.open(INDEX_URL + input))
    plant_name = doc.css('.plant-info .botanical-name').text.strip
    plant_type = doc.css('.plant-info .block-field-blocknodeplantfield-plant-type-term').text.strip
    plant_sun = doc.css('.plant-info .block-field-blocknodeplantfield-sun-exposure-term').text.strip
    plant_ph = doc.css('.plant-info .block-field-blocknodeplantfield-soil-ph-term').text.strip
    plant_flower_color = doc.css('.plant-info .block-field-blocknodeplantfield-flower-color-term').text.strip
    plant_hardiness = doc.css('.plant-info .block-field-blocknodeplantfield-hardiness-zone-term').text.strip
    plant_special = doc.css('.plant-info .block-field-blocknodeplantfield-special-features-term').text.strip
    plant_info = doc.css('.field--type-text-long').text

    
    puts plant_name
    puts plant_type
    puts plant_sun
    puts plant_ph
    puts plant_flower_color
    puts plant_hardiness
    puts plant_special

    puts "#{plant_info}"
    # plant_info needs to be formatted better

    # plant_info.each do |plant|
    # Plant.new(formatted_name, formatted_description)
    # end
  end
end
