require 'nokogiri'
require 'open-uri'
require_relative 'plant'

class List
  @@list = []

  def self.make_list
    list_URL = 'https://www.almanac.com/gardening/growing-guides'
    doc = Nokogiri::HTML(URI.open(list_URL))
    plant_name = doc.css('.views-field-title')
    system('clear')
    plant_name.each do |plant|
      plant_text = plant.text
      case plant_text
      when 'Artichokes'
        puts '-----'
        puts 'Vegetables:'
        puts '-----'
      when 'Apples'
        puts '-----'
        puts 'Fruits:'
        puts '-----'
      when 'Basil'
        puts '-----'
        puts 'Herbs:'
        puts '-----'
      when 'Amaranth'
        puts '-----'
        puts 'Flowers:'
        puts '-----'
      when 'Bamboo'
        puts '-----'
        puts 'Foliage Plants:'
        puts '-----'
      when 'Arborvitae'
        puts '-----'
        puts 'Trees, Shrubs, and Vines'
        puts '-----'
      when 'AfricanViolets'
        puts '-----'
        puts 'Houseplants:'
        puts '-----'
      end

      puts " - #{plant_text}"
    end
  end
end
