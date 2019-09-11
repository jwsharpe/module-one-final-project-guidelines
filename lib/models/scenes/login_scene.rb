class LoginScene < Scene
  def run
    puts "LOGIN : Enter User Name"
    name = gets.chomp
    current_user = nil

    if User.user_exist?(name.upcase)
      current_user = User.find_by(name: name.upcase)
      puts "Welcome back, #{name}."
      @session.drawings = current_user.drawings
    else
      puts "Creating New User"
      current_user = User.create(name: name.upcase)
      puts "Welcome #{name}."
    end
    @session.user = current_user
    @session
  end
end
