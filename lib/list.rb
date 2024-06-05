require 'nokogiri'
require 'open-uri'
require_relative 'plant'

class List
    #Empty arrays populated by make_list
  @master_list = []
  @vegetables = []
  @fruits = []
  @herbs = []
  @flowers = []
  @foliage_plants = []
  @woody_plants = []
  @houseplants = []

  def self.make_list
    list_URL = 'https://www.almanac.com/gardening/growing-guides'
    doc = Nokogiri::HTML(URI.open(list_URL))
    plant_name = doc.css('.views-field-field-grid-title > h3 > a')
    plant_name.each_with_index do |plant, i|
      # This loop finds the first plant of each category and creates an Index
      plant_text = plant.text
        # This strips any residual HTML
      case plant_text
      when 'Artichokes'
        @vegetable_index = i
      when 'Apples'
        @fruit_index = i
      when 'Basil'
        @herb_index = i
      when 'Amaranths'
        @flower_index = i
      when 'Bamboo'
        @foliage_index = i
      when 'Boxwoods'
        @woody_index = i
      when 'African Violets'
        @houseplants_index = i
      end
    end

    plant_name.each_with_index do |plant, i|
      # This loop sorts the plants by category, using the index created above
      if @vegetable_index <= i && i < @fruit_index
        @vegetables << plant
      elsif @fruit_index <= i && i < @herb_index
        @fruits << plant
      elsif @herb_index <= i && i < @flower_index
        @herbs << plant
      elsif @flower_index <= i && i < @foliage_index
        @flowers << plant
      elsif @foliage_index <= i && i < @woody_index
        @foliage_plants << plant
      elsif @woody_index <= i && i < @houseplants_index
        @woody_plants << plant
      else
        @houseplants << plant
      end
    end
  end

  def self.pick_list(plant)
    case plant
    when 'vegetables'
      puts '+--------------------+'
      puts '|     Vegetables     |'
      puts '+--------------------+'
      @vegetables.each do |veg|
        puts "- #{veg.text}"
      end
    when 'fruits'
      puts '+--------------------+'
      puts '|      Fruits        |'
      puts '+--------------------+'
      @fruits.each do |fruit|
        puts "- #{fruit.text}"
      end
    when 'herbs'
      puts '+--------------------+'
      puts '|        Herbs       |'
      puts '+--------------------+'
      @herbs.each do |herb|
        puts "- #{herb.text}"
      end
    when 'flowers'
      puts '+--------------------+'
      puts '|       Flowers      |'
      puts '+--------------------+'
      @flowers.each do |flower|
        puts "- #{flower.text}"
      end
    when 'foliage'
      puts '+--------------------+'
      puts '|   Foliage Plants   |'
      puts '+--------------------+'
      @foliage_plants.each do |foliage|
        puts "- #{foliage.text}"
      end
    when 'woody'
      puts '+--------------------+'
      puts '|Trees, Shrubs, Vines|'
      puts '+--------------------+'
      @woody_plants.each do |woody|
        puts "- #{woody.text}"
      end
    when 'houseplants'
      puts '+--------------------+'
      puts '|    House Plants    |'
      puts '+--------------------+'
      @houseplants.each do |house|
        puts "- #{house.text}"
      end
    when 'all'
      full_list
    end
  end

  def self.box_builder
    puts '+--------------------+'
  end

  def self.full_list
    pick_list('vegetables')
    pick_list('fruits')
    pick_list('herbs')
    pick_list('flowers')
    pick_list('foliage')
    pick_list('woody')
    pick_list('houseplants')
  end


  # Used for Testing
  def self.index_check(plant)
    case plant
    when 'vegetables'
      return @vegetable_index
    when 'fruits'
      return @fruit_index
    when 'herbs'
      return @herb_index
    when 'flowers'
      return @flower_index
    when 'foliage'
      return @foliage_index
    when 'woody_plant'
      return @woody_index
    when 'houseplants'
      return @houseplants_index
    end
  end

  def self.array_check(plant)
    case plant
    when 'vegetables'
      return @vegetables
    when 'fruits'
      return @fruits
    when 'herbs'
      return @herbs
    when 'flowers'
      return @flowers
    when 'foliage'
      return @foliage_plants
    when 'woody'
      return @woody_plants
    when 'houseplants'
      return @houseplants
    end
  end

  def self.list_builder
    @master_list << @vegetables
    @master_list << @fruits
    @master_list << @herbs
    @master_list << @flowers
    @master_list << @foliage_plants
    @master_list << @woody_plants
    @master_list << @houseplants
  end

  def self.master_list_check
    this.list_builder
    return @master_list
  end
end
