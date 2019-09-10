require 'pry'
def run_program
    @@current_user = nil
    login
    user_name = gets.chomp
    self.welcome_user(user_name)
    privacy_option
    user_privacy = gets.chomp 
    privacy(user_privacy, @@current_user)
    setting_list
    program_choice = gets.chomp
    
end

def login
    puts "Welcome To Drawing Application"
    puts "==============================="
    puts "LOGIN : Enter User Name"
end

def self.welcome_user(name)
    if User.user_exist?(name)
        @@current_user = User.find_by(name: name)
        puts "Welcome #{name}. Existing User "
    else
        puts "Creating New User"
        @@current_user = User.create(name: name)
    end
end

def privacy_option
    puts "Choose option:"
    puts "1. Private Project."
    puts "2. Public Project."
    puts "3. Collaborative"
end

def privacy(option,current_user)
    if option == "1" 
        private_project_list(current_user)
    elsif option == "2"
        public_project_list
    elsif option == "3"
        "Collaborative"
    else
        puts "Sorry! Wrong key enter"
    end
end

def private_project_list(current_user)
    puts "PRIVATE DRAWINGS:"
    print_list(current_user.private_drawings)
end

def public_project_list
    puts "PUBLIC DRAWINGS:"
    print_list(Drawing.public_drawings)
end

def print_list(list) #helper method to print list
    list.each_with_index do |drawing,index|
        puts "#{index +1 } -> #{drawing.title}"
    end
    puts "#{current_user.private_drawings.count + 1} -> Create New Drawing"
end

def setting_list
    puts ""
end
