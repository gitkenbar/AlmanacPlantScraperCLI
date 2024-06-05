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

    # Builds base menu
    puts "                             --{[( #{Plant.title} )]}--" if Plant.title
    puts '+-----------------------------------------------------------------------------+'
    puts "|  Available Commands  |     'list'     |     plant name     |     'exit'     |"
    puts '+-----------------------------------------------------------------------------+'

    if @show_list
    # Displays all the categories of plants that can be called
    puts "|     'vegetables'      |     'fruits'    |     'herbs'    |     'flowers'    |"
    puts "|     'houseplants'     |     'woody'     |      'all'     |     'foliage'    |"
    puts '+-----------------------------------------------------------------------------+'
    end

    if Plant.title
    puts "|    'main'   |   'planting'   |   'care'    |   'varieties'   |   'pests'    |"
    puts '+-----------------------------------------------------------------------------+'
    end
  end

  def self.choose_option(i)
    # This is the primary controller, all user input flows through this function
    list_options = %w[vegetables fruits herbs flowers houseplants woody foliage all]
    case i
    when 'main'
      Plant.main
    when 'grow'
      Plant.growing
    when 'planting'
      Plant.planting
    when 'care'
      Plant.care
    when 'pests'
      Plant.pests
    when 'varieties'
      Plant.varieties
    when 'exit'
      end_program
    when 'list'
      system('clear')
      @show_list = !@show_list
    when 'logout'
      Auth.logout
    when *list_options
      @show_list = false
      system('clear')
      List.pick_list(i)
    else
      # needs to send data to 'plant.rb' to be checked
      Plant.plant_info(i)
    end
  end

  # end program
  def self.end_program
    puts 'Thank you for using the Almanac Plant CLI'
    menu = 'exit'
  end
end
