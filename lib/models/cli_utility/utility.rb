
def print_list(list) #helper method to print list
  list.each_with_index do |element, index|
    puts "#{index + 1}: #{element.title}"
  end
end

def privacy_option
  puts "Choose option:"
  puts "1. Private Project."
  puts "2. Public Project."
  puts "3. Collaborative"
end

def prompt_new_project(privacy_setting)
  puts "Enter Title:"
  new_title = gets.chomp
  @@user.drawings.create(title: new_title, private: privacy_setting)
end
