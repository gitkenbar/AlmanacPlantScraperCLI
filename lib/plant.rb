require_relative 'scraper'

# Needs Rework! Only displays a handful of fields.
# Needs to break up document and display one chunk at a time
class Plant
  attr_accessor :name

  @@plants = []

  def initialize(name)
    @name = name
    @description = description
    @@plants << self
  end

  def self.plant_info(i)
    doc = Scraper.scrape_plant(i)
    #-Plant Data variables
    plant_name = doc.css('.field--name-field-botanicalname').text.strip
    plant_type = doc.css('.field--name-field-plant-type-term').text.strip
    plant_flower_color = doc.css('.field--name-field-flower-color-term').text.strip
    plant_special = doc.css('.field--name-field-special-features-term').text.strip
    plant_text_body = doc.css('.field--name-field-body').text.strip
    wit_wisdom = doc.css('.field--name-field-wit-and-wisdom').text.strip

  puts plant_name
  puts plant_type
  puts plant_flower_color
  puts plant_special
  puts '----------'
  puts plant_text_body
  puts '----------'
  puts wit_wisdom
  end

  def self.grow_plant(i)
    doc = Scraper.scrape_vegetable(i)
    #-Growing Information variables
    plant_sun = doc.css('.field--name-field-sun-exposure-term').text.strip
    plant_ph = doc.css('.field--name-field-soil-ph-term').text.strip
    planting_info = doc.css('.field--name-field-planting').text.strip
    plant_hardiness = doc.css('.plant-info .block-field-blocknodeplantfield-hardiness-zone-term').text.strip
    growing = doc.css('.field--name-field-care').text.strip
    harvesting = doc.css('.field--name-field-harvest').text.strip
    recommended_varieties = doc.css('.field--name-field__recommended').text.strip
    pests_diseases = doc.css('.field--name-field-pests').text.strip

    puts plant_sun
    puts plant_ph
    puts planting_info
    puts plant_hardiness
    puts growing
    puts harvesting
    puts recommended_varieties
    puts pests_diseases
  end
  

  

  def self.clear
    @@plants.clear
  end
end
