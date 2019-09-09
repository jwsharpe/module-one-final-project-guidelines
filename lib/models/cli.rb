def greeting
    welcome_msg
    
    user_name = gets.chomp
    self.welcome_user(user_name)
end

def welcome_msg
    puts "Welcome To Drawing Application"
    puts "==============================="
    puts "LOGIN : Enter User Name"
end

def self.welcome_user(name)
    if User.check_user(name)
        puts "Welcome #{name}. Existing User "
    else
        User.new(name:name)
    end
end
