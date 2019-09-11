class CliRenderer
  def self.print_greeting
    puts "Welcome To Drawing Application"
    puts "==============================="
  end

  def self.print_attribute_list(list, attr) #helper method to print list
    list.each_with_index do |element, index|
      puts "#{index + 1}: #{element.send(attr)}"
    end
  end

  def self.print_privacy_options
    puts "Choose option:"
    puts "1. Private Project"
    puts "2. Public Project"
    puts "3. Collab Project"
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
    puts "#{privacy} PROJECTS"
    puts "^" * 90
  end

  def self.print_create_drawing
    puts "+ -> Create New Drawing"
  end

  def self.prompt_user_name
    puts "LOGIN : Enter User Name"
    name = gets.chomp
  end

  def greet_returning_user(user)
    puts "Welcome back, #{user}."
  end

  def greet_new_user(user)
    puts "Creating New User"
    puts "Welcome #{user}"
  end
end
