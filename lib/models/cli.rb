def run_program
  greeting # greet msg
  @@user = login # return user
  privacy_setting = project_groups # return string e.i. "private"
  drawings = list_project(privacy_setting) # return array of drawing
  drawing = select_project(drawings, privacy_setting) # return a selected drawing
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


def list_project(privacy_setting)
  if privacy_setting == "public"
    Drawing.public_drawings
  else privacy_setting == "private"
    @@user.private_drawings   end
end

def select_project(drawings, privacy_setting)
  puts "#{privacy_setting.upcase} PROJECTS"
  print_list(drawings)
  program_choice = gets.chomp
  if program_choice == "+"
    prompt_new_project(privacy_setting)
  elsif (program_choice.to_i)
    if (drawings[program_choice.to_i - 1])
      drawings[program_choice.to_i - 1]
    else
      select_project(drawings privacy_setting)
    end
  else
    select_project(drawings privacy_setting)
  end
end

def list_drawing_setting(drawing)
  puts "1 -> Open Project (Edit)"
  puts "2 -> Delete Project"
  puts "3 -> Add Collaborative"
  program_choice = gets.chomp
  case program_choice
  when "1"
    puts "Opening Project..."
    drawing.open
  when "2"
    puts "Terminating Project :...."
    drawing.destroy
  when "3"
    add_collaborator(drawing)
  else
    puts "Invalid Input!"
    list_drawing_setting(drawing)
  end
end

def add_collaborator(drawing)
  collab = prompt_collaborator
end

def prompt_collaborator
  User.all.each_with_index do |user, index|
    puts "#{index + 1} -> #{user.name}."
  end
end
