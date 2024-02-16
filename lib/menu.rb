require_relative 'scraper'
require_relative 'plant'
require_relative 'list'
require_relative 'user'

module Menu
  # menu
  def self.menu
    menu_options
    input = gets.chomp.strip.downcase.gsub(' ', '-')
    choose_option(input)
  end

  # list of options
  def self.menu_options
    puts '--------------------------------------------------------'
    puts '--------------Type list to see all plants---------------'
    puts '--Type a plant to display information about that plant--'
    puts "----------Exit the program by entering 'exit'-----------"
    puts '--------------------------------------------------------'
  end

  def self.plant_list
    List.make_list
  end

  def self.choose_option(i)
    agri_info = i.gsub('grow-', '')
    puts agri_info
    case i
    when 'exit'
      self.end_program
    when 'list'
      self.plant_list
    when 'logout'
      Auth.logout
    else
      #needs to send data to 'plant.rb' to be checked
      Plant.plant_info(i)
    end
  end

  
  # end program
  def self.end_program
    puts 'Thank you for using the Almanac Plant CLI'
    menu = 'exit'
  end
end