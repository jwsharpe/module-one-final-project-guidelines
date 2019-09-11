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
