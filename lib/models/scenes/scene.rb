class Scene
  attr_reader :method, :session

  def initialize(method, session)
    @method = method
    @session = session
  end

  def run
    self.send(@method)
  end

  def login
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

  def project_groups
    CliRenderer.print_privacy_options
    option = gets.chomp
    case option
    when "1"
      @session.privacy_setting = "private"
      @session
    when "2"
      @session.privacy_setting = "public"
      @session
    when "3"
      @session.privacy_setting = "collaborative"
      @session
    else
      CliRenderer.print_invalid_input
      @session = project_groups
    end
  end

  def select_project
    puts "#{@session.privacy_setting.upcase} PROJECTS"
    puts "^" * 90
    drawings = session.drawings.where(private: session.privacy_setting)
    CliRenderer.print_attribute_list(drawings, :title)
    if (@session.privacy_setting != "collaborative")
      puts "+ -> Create New Drawing"
    end

    program_choice = gets.chomp
    if program_choice == "+" && @session.privacy_setting != "collaborative"
      CliRenderer.prompt_new_project(@session)
      @session = select_project
    elsif (program_choice.to_i > 0)
      if (drawings[program_choice.to_i - 1])
        @session.drawing = drawings[program_choice.to_i - 1]
        @session
      else
        CliRenderer.print_header("Choose Existing Project By Index!")
        @session = select_project
      end
    else
      CliRenderer.print_header("Enter Project Index Number!")
      @session = select_project
    end
  end

  def list_drawing_setting
    CliRenderer.print_header(
      "1 -> Open Project (Edit)",
      "2 -> Delete Project",
      "3 -> Add Collaborator"
    )
    program_choice = gets.chomp
    case program_choice

    when "1"
      CliRenderer.print_header("Opening Projects...")
      session.drawing.open
    when "2"
      CliRenderer.print_header("Terminating Projects...")
      session.drawing.destroy
    when "3"
      add_collaborator(session)
      list_project(session)
    else
      CliRenderer.print_invalid_input
      list_drawing_setting(session)
    end
  end

  def add_collaborator(session)
    collab = prompt_collaborator
    session.drawing.add_collaborator(collab)
  end

  def prompt_collaborator
    CliRenderer.print_attribute_list(User.all, :name)
    CliRenderer.print_header("Choose User by Index:")
    collaborator = gets.chomp

    if (collaborator.to_i)
      if (User.all[collaborator.to_i - 1])
        User.all[collaborator.to_i - 1]
      else
        CliRenderer.print_invalid_input
        prompt_collaborator
      end
    else
      CliRenderer.print_invalid_input

      prompt_collaborator
    end
  end
end # end of class
