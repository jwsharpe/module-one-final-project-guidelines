class CliRenderer
  def print_greeting
    puts "Welcome To Drawing Application"
    puts "==============================="
  end

  def print_attribute_list(list, attr) #helper method to print list
    list.each_with_index do |element, index|
      puts "#{index + 1}: #{element.send(attr)}"
    end
  end

<<<<<<< HEAD
def print_privacy_options(user_status)
  puts "Choose option:"
  puts "1. Private Project"
  puts "2. Public Project"
  puts "3. Collab Project" if user_status == false 
end
=======
  def print_privacy_options
    puts "Choose option:"
    puts "1. Private Project"
    puts "2. Public Project"
    puts "3. Collab Project"
  end
>>>>>>> 28ec6c4c8096e3a93318957a56cfed76c692b610

  def prompt_new_project(privacy_setting)
    puts "Enter Title:"
    new_title = gets.chomp
    @@user.drawings.create(title: new_title, private: privacy_setting)
  end
end
