require_relative 'auth'
require_relative 'menu'
class CLI
  # run
  def run 
    # When application runs, first make the plant list
    List.make_list
    # Clear the console
    system('clear')
    # Say hi!
    greeting
    # Log In (Not currently implemented)
    # Auth.authenticate

    # Run the menu
    while Menu.menu != 'exit'
      # while menu isn't exit, keep executing menu
    end
  end

  # greeting

  def greeting
    puts 'Welcome to the Almanac Plant Scraper CLI!'
  end
end
