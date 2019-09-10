def greeting
    current_user = nil
    login
    user_name = gets.chomp
    self.welcome_user(user_name)
    privacy_option
    user_privacy = gets.chomp 
    privacy(user_privacy, current_user)
end

def login
    puts "Welcome To Drawing Application"
    puts "==============================="
    puts "LOGIN : Enter User Name"
end

def self.welcome_user(name)
    if User.user_exist?(name)
        puts "Welcome #{name}. Existing User "
    else
        puts "Creating New User"
        current_user = User.create(name: name)
    end
end

def privacy_option
    puts "Choose option:"
    puts "1. Private Project."
    puts "2. Public Project."
    puts "3. Collaborative"
end

def privacy(option,current_user)
    if option = "1" 
        current_user.
    elsif option = "2"
        "list Public"
    else  
        puts "Sorry! Wrong key enter"
    end
end
