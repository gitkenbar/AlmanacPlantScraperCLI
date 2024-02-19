require_relative 'auth'
require_relative 'menu'
class CLI
  # run
  def run
    List.make_list
    system('clear')
    greeting
    # Auth.authenticate

    while Menu.menu != 'exit'
      # while menu isn't exit, keep executing menu
    end
  end

  # greeting

  def greeting
    puts 'Welcome to the Almanac Plant Data Scraper API!'
  end
end
