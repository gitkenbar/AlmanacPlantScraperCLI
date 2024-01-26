require_relative 'scraper'
require_relative 'plant'
require_relative 'list'
require_relative 'user'

class CLI
  # run
  def run
    system('clear')
    greeting
    authenticate
    while menu != 'exit'
      # while menu isn't exit, keep executing menu
    end
  end
  # greeting

  def greeting
    puts 'Welcome to the Almanac Plant CLI'
  end

  # end program
  def end_program
    puts 'Thank you for using the Almanac Plant CLI'
    menu = 'exit'
  end

  # menu
  def menu
    menu_options
    input = gets.chomp.strip.downcase.gsub(' ', '-')
    choose_option(input)
  end

  # list of options
  def menu_options
    puts '--------'
    puts '--Type list to see all plants'
    puts '--Type a plant to display information about that plant'
    puts "--Exit the program by entering 'exit'"
    puts '--------'
  end

  def vegetable_list
    List.make_list
  end

  def choose_option(input)
    case input
    when 'exit'
      end_program
    when 'list'
      vegetable_list
    when 'logout'
      logout
    else
      scrape_vegetables(input)
    end
  end

  def scrape_vegetables(input)
    # pulls too much!
    # needs to scrape off comments
    # needs to display one category at a time, and do it prettier!
    Scraper.scrape_vegetable(input)
    # Plant.list_plants(input)
  end

  def authenticate
    authenticated = false

    until authenticated
      puts 'Please login or Sign up'
      puts 'Which do you choose? (sign up/login)'
      get_input = gets.chomp.downcase
      if get_input == 'login'
        # authenticate user
        authenticated = login
      elsif get_input === 'sign up'
        # create user process
        create_account
      else
        puts 'Syntax Error, please try again'
      end
    end
  end

  def login
    puts 'Please enter you username'
    username = gets.chomp
    puts 'Please enter your password'
    password = gets.chomp

    # call authentication from user class
    result = User.authenticate(username, password)

    if result
      puts "Welcome back #{username}"
    else
      puts 'Invalid Username or Password'
    end

    result
  end

  def create_account
    # get user info
    puts 'Please enter you username'
    username = gets.chomp
    puts 'Please enter your password'
    password = gets.chomp

    User.new(username, password)
  end

  def logout
    authenticated = false
  end
end
