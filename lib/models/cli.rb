require 'pry'
def run_program
    greeting # greet msg
    @@user = login # return user
    privacy_setting = project_groups # return string e.i. "private"
    drawings = list_project(privacy_setting) # return array of drawing
    drawing = select_project(drawings,privacy_setting) # return a selected drawing
    list_drawing_setting(drawing) 
    
end

def greeting
    puts "Welcome To Drawing Application"
    puts "==============================="
    
end
def login
    puts "LOGIN : Enter User Name"
    name = gets.chomp 
    current_user = nil
    if User.user_exist?(name)
        current_user = User.find_by(name: name)
        puts "Welcome back, #{name}."
    else
        puts "Creating New User"
        current_user = User.create(name: name)
        puts "Welcome #{name}."
    end
    current_user
end

def project_groups
    privacy_option
    option = gets.chomp
    if option == "1" 
        "private"
    elsif option == "2"
         "public"
    else
        puts "Invalid key!"
        project_groups
    end
end

def privacy_option
    puts "Choose option:"
    puts "1. Private Project."
    puts "2. Public Project."
    puts "3. Collaborative"
end

def list_project(privacy_setting)
    if privacy_setting == "public"
        Drawing.public_drawings
    else privacy_setting == "private"
        @@user.private_drawings
    end
end

def select_project(drawings,privacy_setting)
    puts "#{privacy_setting.upcase} PROJECTS"
    print_list(drawings)
    program_choice = gets.chomp
    if program_choice == "+"
        prompt_new_project(privacy_setting)
    elsif(program_choice.to_i)
        if(drawings[program_choice.to_i-1])
            drawings[program_choice.to_i-1]
        else
            select_project(drawings privacy_setting)
        end
    else
        select_project(drawings privacy_setting)
    end
end

def prompt_new_project(privacy_setting)
    puts "Enter Title:"
    new_title = gets.chomp
    @@user.drawings.create(title: new_title, private: privacy_setting)
end


def print_list(list) #helper method to print list
    list.each_with_index do |drawing,index|
        puts "#{index +1 } -> #{drawing.title}"
    end
    puts "+ -> Create New Drawing"
end

def list_drawing_setting(drawing)
    puts "1 -> Open Project (Edit)"
    puts "2 -> Delete Project"
    program_choice = gets.chomp
    case program_choice
    when "1"
        puts "Opening Project..."
        drawing.open
    when "2"
        puts "Terminating Project :...."
        drawing.destroy 
    else
        puts "Invalid Input!"
        list_drawing_setting(drawing)
    end
end
