class Cli
  def run_program
    util = CliRenderer.new
    util.print_greeting # greet msg
    session = Session.new
    session.user = login # return user
    session.privacy_setting = project_groups(util) # return string e.i. "private"
    drawings = list_project(session) # return array of drawing'
    session.drawing = select_project(drawings, session,util) # return a selected drawing
    list_drawing_setting(session,util)
  end

  def login
    puts "LOGIN : Enter User Name"
    name = gets.chomp
    current_user = nil

    if User.user_exist?(name.upcase)
      current_user = User.find_by(name: name.upcase)
      puts "Welcome back, #{name}."
    else
      puts "Creating New User"
      current_user = User.create(name: name.upcase)
      puts "Welcome #{name}."
    end
    current_user
  end

  def project_groups(util)
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
      project_groups(util)
    end
  end

  def list_project(session)
    case session.privacy_setting
    when "public"
      Drawing.public_drawings
    when "private"
      session.user.private_drawings
    when "collaborative"
      session.user.collab_drawings
    end
  end

  def select_project(drawings, session,util)
    puts "#{session.privacy_setting.upcase} PROJECTS"
    puts "^" * 90
    util.print_attribute_list(drawings, :title)
    if (session.privacy_setting != "collaborative")
      puts "+ -> Create New Drawing"
    end
    program_choice = gets.chomp
    if program_choice == "+" && session.privacy_setting != "collaborative"
      util.prompt_new_project(session.user, session.privacy_setting)
      select_project(list_project(session),session,util)
    elsif (program_choice.to_i > 0)
      if (drawings[program_choice.to_i - 1])
        drawings[program_choice.to_i - 1]
      else
        puts "=" * 90
        puts "Choose Existing Project By Index!"
        puts "=" * 90
        select_project(drawings, session,util)
      end
    else
      puts "=" * 90
      puts "Enter Project Index Number!"
      puts "=" * 90
      select_project(drawings, session,util)
    end
  end

  def list_drawing_setting(session,util)
    puts "=" * 90
    puts "1 -> Open Project (Edit)"
    puts "2 -> Delete Project"
    puts "3 -> Add Collaborative"
    puts "=" * 90
    program_choice = gets.chomp
    case program_choice
    when "1"
      puts "=" * 90
      puts "Opening Project..."
      puts "=" * 90
      session.drawing.open
    when "2"
      puts "=" * 90
      puts "Terminating Project :...."
      puts "=" * 90
      session.drawing.destroy
    when "3"
      add_collaborator(session,util)
      session.user.collab_drawings
    else
      puts "=" * 90
      puts "Invalid Input!"
      puts "=" * 90
      list_drawing_setting(session,util)
    end
  end

  def add_collaborator(session,util)
    collab = prompt_collaborator(util)
    session.drawing.add_collaborator(collab)
  end

  def prompt_collaborator(util)
    util.print_attribute_list(User.all, :name)
    puts "=" * 90
    puts "Choose User By Index: "
    puts "=" * 90
    collaborator = gets.chomp

    if (collaborator.to_i)
      if (User.all[collaborator.to_i - 1])
        User.all[collaborator.to_i - 1]
      else
        puts "=" * 90
        puts "Invalid Input"
        puts "=" * 90
        prompt_collaborator
      end
    else
      puts "=" * 90
      puts "Invalid Input"
      puts "=" * 90
      prompt_collaborator
    end
  end
end # end of class
