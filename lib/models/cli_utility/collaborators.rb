def add_collaborator(drawing)
  collab = prompt_collaborator
end

def prompt_collaborator
  print_list(User.all)
  collaborator = gets.chomp
  collaborator.to_i
  User.all.find_by(id: collaborator)
end

