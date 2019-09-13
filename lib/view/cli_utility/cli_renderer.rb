require "paint"

class CliRenderer
  def self.print_greeting
    puts Paint["=" * 40, :bright, :blue]
    puts Paint["\nWelcome To Drawing Application\n", [10, 250, 90]]
    puts Paint["=" * 40, :bright, :blue]
  end

  def self.print_spacer
    puts ""
    puts "-" * 25
    puts ""
  end

  def self.print_attribute_list(list, attrib) #helper method to print list
    print_args(
      list.each_with_index.map { |element, index| "#{index + 1}: #{element.send(attrib)}" }
    )
  end

  def self.print_privacy_options
    print_border
    print_header_with_color("Privacy Settings")
    print_header(
      "1. Private Project",
      "2. Public Projects",
      "3. Collab Projects",
      back_string,
      end_string
    )
  end

  def self.prompt_new_project
    print "Enter Title: "
    gets.chomp
  end

  # def self.prompt_user_by_choice(choice)
  #   print choice + ":"
  #   gets.chomp
  # end

  def self.print_header_with_color(heading)
    print_border
    puts Paint[heading,[242, 238, 12]]
    print_border
  end

  def self.print_header(*texts)
    print_border
    print_args(texts)
    print_border
  end

  def self.print_args(*texts)
    texts.each do |msg|
      puts msg
    end
  end

  def self.print_invalid_input
    print_header("Invalid Input!")
  end

  def self.print_border
    puts Paint["-" * 40, :bright, :blue]
  end

  def self.print_privacy_header(privacy)
    print_header_with_color("#{privacy.capitalize} Projects")
  end

  def self.print_create_drawing
    puts "+. Create New Drawing"
  end

  def self.prompt_user_name
    print_header_with_color("LOGIN : Enter User Name")
    prompt_user_by_choice("Username:")
    # print "Username: "
    # gets.chomp
  end

  def self.greet_returning_user(user)
    print_border
    puts Paint["Welcome back, #{user}.", :inverse]
  end

  def self.greet_new_user(user)
    self.print_header("Creating New User.....","Welcome #{user}")
  end

  def self.print_goodbye
    print_header_with_color("Goodbye!")
  end

  def self.prompt_program_choice
    CliRenderer.print_header(
      "1. Open Project (Edit)",
      "2. Delete Project",
      "3. Add Collaborator",
      "4. Remove Collaborator",
      back_string,
      end_string
    )
    prompt_user_by_choice("Option:")
    # print "Option: "
    # gets.chomp
  end

  def self.prompt_user_by_choice(choice)
    print Paint[choice + ":",[242, 238, 12]]
    gets.chomp
  end

  def self.print(msg)
    puts msg
  end

  def self.print_back_and_end
    puts back_string
    puts end_string
  end

  private

  def self.back_string
    "b. Previous Menu"
  end
  def self.end_string
    "e. Exit"
  end
end
