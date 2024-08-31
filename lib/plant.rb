require_relative 'scraper'

class Plant
  def self.plant_info(plant_name)
    system('clear')
    doc = Scraper.scrape_plant(plant_name)

    #-Plant Data variables
    @plant_name = doc.css('.page-title').text.strip

    @plant_text_body = doc.css(
      '.field--name-field-body > p,
      .field--name-field-body > h3,
      .field--name-field-body > figure,
      .field--name-field-body > li'
    )

    @wit_wisdom = doc.css('.field--name-field-wit-and-wisdom > .field__item > ul > li')

    @planting_info = doc.css(
      '.field--name-field-planting > .field__item > p,
     .field--name-field-planting > .field__item > h4,
     .field--name-field-planting > .field__item > ul > li'
    )

    @growing = doc.css(
      '.field--name-field-care > .field__label,
      .field--name-field-care > .field__item > ul > li'
    )

    @harvesting = doc.css(
      '.field--name-field-harvest  .field__item > p,
      .field--name-field-harvest  .field__item > h4,
      .field--name-field-harvest  .field__item > ul > li'
    )
    @pest_disease_title = doc.css('.field--name-field-pests > .field__label')
    @pests_diseases = doc.css(
      '.field--name-field-pests > .field__item > p')
    @pests_table_title = doc.css('.field--name-field-pests > .field__item > .plant-table > table > caption')

    @pests_diseases_table_headers = doc.css('.field--name-field-pests > .field__item > .plant-table > table > thead > tr > th')
    @pests_diseases_rows = doc.css('.field--name-field-pests > .field__item > .plant-table > table > tbody > tr')
    @pests_diseases_list = doc.css('.field--name-field-pests > .field__item')
    @pests_rows_titles = @pests_diseases_rows.css('th')

    @recommended_varieties = doc.css(
      '.field--name-field__recommended > .field__label,
      .field--name-field__recommended  .field__item > p,
      .field--name-field__recommended .field__item > ul > li'
    )

    # needs to pull <p> <h3> <figure> <li>

    @plant_type = doc.css('.field--name-field-plant-type-term').text.strip
    @botanical_name = doc.css('.field--name-field-botanicalname').text.strip
    @plant_flower_color = doc.css('.field--name-field-flower-color-term').text.strip
    @plant_special = doc.css('.field--name-field-special-features-term').text.strip

    @plant_sun = doc.css('.field--name-field-sun-exposure-term > .field__items > .field__item > a').text
    @plant_ph = doc.css('.field--name-field-soil-ph-term').text.strip
    @plant_hardiness = doc.css('.block-field-blocknodeplantfield-hardiness-zone-term').text.strip

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
    @plant_text_body.each do |field|
      puts "  #{field.text}"
      puts ' '
    end
    @wit_wisdom.each do |field|
      puts "  #{field.text}"
      puts ' '
    end
  end

  def self.planting
    system('clear')
    puts @plant_sun
    puts @plant_ph
    puts @plant_hardiness
    @planting_info.each do |field|
      puts "  #{field.text}"
      puts ' '
    end
  end

  def self.care
    system('clear')
    @growing.each do |field|
      puts "  #{field.text}"
      puts ' '
    end
    @harvesting.each do |field|
      puts "  #{field.text}"
      puts ' '
    end
  end

  def self.pests
    # if pests is in the form of a ul, it does not render
    system('clear')
    @pests_table_title.text
    if @pests_diseases_rows
      @pests_diseases_rows.each do |field|
        pest_name = field.css('th')
        pest_data = field.css('td')
        puts '-------'
        puts "  #{pest_name.text}   Type: #{pest_data[0].text}"
        puts '-------'
        puts " -#{@pests_diseases_table_headers[2].text} "
        puts "    #{pest_data[1].text}"
        puts " -#{@pests_diseases_table_headers[3].text} "
        puts "    #{pest_data[2].text}"
        puts ''
      end
    elsif @pests_diseases
      @pests_diseases.each do |field|
        puts "  #{field.text}"
        puts ' '
      end
    elsif @pests_diseases_list
      @pests_diseases_list.each do |field|
        puts "  #{field.text}"
        puts ' '
      end
    else
      puts 'There was an Issue'
    end
  end

  def self.varieties
    system('clear')
    @recommended_varieties.each do |field|
      puts "  #{field.text}"
      puts ' '
    end
  end

  def self.formatter(i)
    puts "   #{i.text}"
    puts ' '
  end

  def self.clear
    @@plants.clear
  end


  ## TESTING FUNCTIONS

  def self.check_article(article)
    case article
    when 'main'
      if @plant_text_body
        return true
      else
        return false
      end
    when 'planting'
      if @planting_info
        return true
      else
        return false
      end
    when 'care'
      if @growing
        return true
      else
        return false
      end
    when 'varieties'
      if @recommended_varieties
        return true
      else
        return false
      end
    when 'pests'
      if @pests_diseases
        return true
      else
        return false
      end
    end
  end

end
