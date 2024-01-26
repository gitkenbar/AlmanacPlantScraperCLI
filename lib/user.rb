require 'bcrypt'
require 'json'

class User
  attr_accessor :username, :password

  @@users = []
  ## ^ won't be used in rails

  def initialize(username, password)
    @username = username
    @password = BCrypt::Password.create(password)
    # @id = @@users.length + 1
    # ^^ automatically adds a unique id, but would break if users were removed.
    # add user to external File
    User.store_credentials(self)

    @@users << self
  end

  def self.all
    @@users
  end

  # authenticate user to log in

  def self.authenticate(username, password)
    user = User.find_by_username(username)

    if user && user.password == password
      user
    else
      all
    end
  end

  def self.find_by_username(username)
    user = all.find do |user|
      user.username == username
    end
  end

  def self.store_credentials(user)
    # Step 1: Create
    file_path = 'users.json'
    File.open(file_path, 'w') { |file| file.write(JSON.generate([])) } unless File.exist?(file_path)
    # Step 2: Add user to the File
    file = File.read(file_path)
    users_data = JSON.parse(file)

    users_data << { username: user.username, password: user.password }

    File.open(file_path, 'w') { |file| file.write(JSON.generate(users_data)) }
  end
end