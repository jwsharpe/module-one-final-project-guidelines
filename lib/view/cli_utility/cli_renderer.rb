require 'colorize'

class CliRenderer
  def self.print_greeting
    puts "=" * 40
    puts "Welcome To Drawing Application"
    puts "=" * 40
  end

  def self.print_attribute_list(list, attr) #helper method to print list
    list.each_with_index do |element, index|
      puts "#{index + 1}: #{element.send(attr)}"
    end
    back_and_end_prompt
  end

  def self.print_privacy_options
    puts "Choose option:"
    puts "-" * 40
    puts "1. Private Project"
    puts "2. Public Project"
    puts "3. Collab Project"
    puts "b -> Previous Menu"
    puts "e -> Exit"
    puts "-" * 40
  end

  def self.prompt_new_project
    puts "Enter Title:"
    new_title = gets.chomp
  end

  def self.print_header(*texts)
    puts "=" * 90
    texts.each do |msg|
      puts msg
    end
    puts "=" * 90
  end

  def self.print_invalid_input
    print_header("Invalid Input!")
  end

  def self.print_privacy_header(privacy)
    puts "-" * 40
    puts "#{privacy} PROJECTS"
    puts "^" * 40
  end

  def self.print_create_drawing
    puts "+ -> Create New Drawing"
  end

  def self.prompt_user_name
    puts "LOGIN : Enter User Name"
    puts "-" * 40
    name = gets.chomp
  end

  def self.greet_returning_user(user)
    puts "-" * 40
    puts "Welcome back, #{user}.".colorize(:blue)
    puts "-" * 40
  end

  def self.greet_new_user(user)
    puts "Creating New User....."
    puts "Welcome #{user}"
  end

  def self.print_goodbye
    print_header("Goodbye!")
  end

  def self.prompt_program_choice
    CliRenderer.print_header(
      "1 -> Open Project (Edit)",
      "2 -> Delete Project",
      "3 -> Add Collaborator",
      "b -> Previous Menu",
      "e -> Exit"
    )
    gets.chomp
  end

  def self.print_header_with_prompt(msg)
    print_header(msg)
    gets.chomp
  end

  def self.back_and_end_prompt
    puts "b -> Previous Menu"
      puts "e -> Exit"
      puts "-" * 40
  end
end
