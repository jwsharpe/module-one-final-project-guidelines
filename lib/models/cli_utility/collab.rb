def add_collaborator(drawing)
    collab = prompt_collaborator
    
  end
  
  def prompt_collaborator
      display_all_user
      collaborator = gets.chomp
      collab_int = collaborator.to_i 
      collab_int_minus_one = collab_int - 1 
      colab_id = collab_int_minus_one.to_s
      User.all.find_by(id: collab_id)
  end

  def display_all_user
    User.all.each_with_index do |user,index|
            puts "#{index+1} -> #{user.name}."
        end
  end


  


  
    
  

  
    




