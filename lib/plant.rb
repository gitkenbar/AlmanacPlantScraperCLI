class Plant
  attr_accessor :name

  @@plants = []

  def initialize(name)
    @name = name
    @description = description
    @@plants << self
  end

  def self.all
    @@plants
  end

  def self.first
    @@plants[0]
  end

  def self.list_plants(input)
    puts "Here are the #{input} we have to offer:"
    @@plants.each do |plant|
      puts "##{i} - #{plant}"
    end
  end

  def self.clear
    @@plants.clear
  end
end
