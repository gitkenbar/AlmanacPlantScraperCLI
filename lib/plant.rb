require_relative 'scraper'

# Needs Rework! Only displays a handful of fields.
# Needs to break up document and display one chunk at a time
class Plant
  def self.plant_info(i)
    system('clear')
    doc = Scraper.scrape_plant(i)
    #-Plant Data variables
    @plant_name = doc.css('.page-title').text.strip
    @botanical_name = doc.css('.field--name-field-botanicalname').text.strip
    @plant_type = doc.css('.field--name-field-plant-type-term').text.strip
    @plant_flower_color = doc.css('.field--name-field-flower-color-term').text.strip
    @plant_sun = doc.css('.field--name-field-sun-exposure-term').text.strip
    @plant_special = doc.css('.field--name-field-special-features-term').text.strip
    @plant_text_body = doc.css('.field--name-field-body').text.strip
    @wit_wisdom = doc.css('.field--name-field-wit-and-wisdom').text.strip
    @planting_info = doc.css('.field--name-field-planting').text.strip
    @plant_ph = doc.css('.field--name-field-soil-ph-term').text.strip
    @plant_hardiness = doc.css('.plant-info .block-field-blocknodeplantfield-hardiness-zone-term').text.strip
    @growing = doc.css('.field--name-field-care').text.strip
    @harvesting = doc.css('.field--name-field-harvest').text.strip
    @recommended_varieties = doc.css('.field--name-field__recommended').text.strip
    @pests_diseases = doc.css('.field--name-field-pests').text.strip

    choose_option('main')
  rescue StandardError
  end

  def self.title
    @plant_name
  end

  def self.harvest
    @harvesting
  end

  def self.main
    system('clear')
    puts @plant_type
    puts @botanical_name
    puts @plant_flower_color
    puts @plant_special
    puts @plant_text_body
    puts @wit_wisdom
  end

  def self.planting
    system('clear')
    puts @plant_sun
    puts @plant_ph
    puts @plant_hardiness
    puts @planting_info
  end

  def self.care
    system('clear')
    puts @growing
    puts @harvesting
  end

  def self.pests
    system('clear')
    puts @pests_diseases
  end

  def self.varieties
    system('clear')
    puts @recommended_varieties
  end

  def self.clear
    @@plants.clear
  end
end
