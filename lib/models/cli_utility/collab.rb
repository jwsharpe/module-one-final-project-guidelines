def add_collaborator(drawing)
    collab = prompt_collaborator
    
  end
  
  def prompt_collaborator
      display_all_user
      collaborator = gets.chomp
      collab_int = collaborator.to_i 
      colab_id = collab_int - 1 
      User.all.find_by(id: collab_id)
  end

  def display_all_user
    User.all.each_with_index do |user,index|
            puts "#{index+1} -> #{user.name}."
        end
  end


  


  
    
  

  
    




