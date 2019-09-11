class Cli
  def run_program
    util = CliRenderer.new

    util.print_greeting # greet msg

    session = Session.new

    session.user = login # return user

    session.privacy_setting = project_groups # return string e.i. "private"

    drawings = list_project(session.user, session.privacy_setting) # return array of drawing'

    session.drawing = select_project(drawings, session.privacy_setting) # return a selected drawing

    list_drawing_setting(session.drawing)
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
    util.print_privacy_options
    option = gets.chomp
    case option
    when "1"
      "private"
    when "2"
      "public"
    when "3"
      "collaborative"
    else
      puts "Invalid key!"
      project_groups
    end
  end

  def list_project(user, privacy_setting)
    case privacy_setting
    when "public"
      Drawing.public_drawings
    when "private"
      user.private_drawings
    when "collaborative"
      user.collab_drawings
    end
  end

  def select_project(drawings, privacy_setting)
    puts "#{privacy_setting.upcase} PROJECTS"
    util.print_attribute_list(drawings, :title)
    if (privacy_setting != "collaborative")
      puts "+ -> Create New Drawing"
    end
    program_choice = gets.chomp
    if program_choice == "+" && private_methods != "collaborative"
      util.prompt_new_project(privacy_setting)
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
    drawing.add_collaborator(collab)
  end

  def prompt_collaborator
    print_attribute_list(User.all, :name)
    collaborator = gets.chomp

    if (collaborator.to_i)
      if (User.all[collaborator.to_i - 1])
        User.all[collaborator.to_i - 1]
      else
        puts "Invalid Input"
        prompt_collaborator
      end
    else
      puts "Invalid Input"
      prompt_collaborator
    end
  end
end
