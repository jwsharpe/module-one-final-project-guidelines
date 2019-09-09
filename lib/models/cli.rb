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
    puts "#{name} your journey of drawing starts here"
end
