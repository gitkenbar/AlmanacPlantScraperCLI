# Not currently in use. This was a part of the original assignment that isn't being utilized in the current build

# Auth could be useful to "Favorite" certain plants, app could then check if "Favorite" plant articles have been updated since last read
require_relative 'user'

module Auth
  def self.authenticate
    authenticated = false

    until authenticated
      puts 'Please login or Sign up'
      puts 'Which do you choose? (sign up/login)'
      get_input = gets.chomp.downcase
      if get_input == 'login'
        # authenticate user
        authenticated = Auth.login
      elsif get_input === 'sign up'
        # create user process
        create_account
      else
        puts 'Syntax Error, please try again'
      end
    end
  end

  def self.login
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

  def self.create_account
    # get user info
    puts 'Please enter you username'
    username = gets.chomp
    puts 'Please enter your password'
    password = gets.chomp

    User.new(username, password)
  end

  def self.logout
    authenticated = false
  end
end
