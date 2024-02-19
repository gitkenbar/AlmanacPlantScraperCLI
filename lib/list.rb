require 'nokogiri'
require 'open-uri'
require_relative 'plant'

class List
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
    plant_name = doc.css('.views-field-title')

    plant_name.each_with_index do |plant, i|
      plant_text = plant.text
      puts plant.text
      case plant_text
      when 'Apples'
        @fruit_index = i
      when 'Basil'
        @herb_index = i
      when 'Amaranth'
        @flower_index = i
      when 'Bamboo'
        @foliage_index = i
      when 'Arborvitae'
        @woody_index = i
      when 'African Violets'
        @houseplants_index = i
      end
    end

    plant_name.each_with_index do |plant, i|
      if i < @fruit_index
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

  def self.display_list
    system('clear')
    puts '+-----------------------------------------------+'
    puts "| 'vegetables' | 'fruits' | 'herbs' | 'flowers' |"
    puts "| 'houseplants'| 'woody'  |  'all'  | 'foliage' |"
    puts '+-----------------------------------------------+'
    input = gets.chomp.strip.downcase.gsub(' ', '-')
    pick_list(input)
  end

  def self.pick_list(i)
    case i
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

  def self.full_list
    pick_list('vegetables')
    pick_list('fruits')
    pick_list('herbs')
    pick_list('flowers')
    pick_list('foliage')
    pick_list('woody')
    pick_list('houseplants')
  end

  def self.relic_code
    @plant_array.each do |plant|
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
