class CollaboratorScene < Scene
  def run
    collab = prompt_collaborator
    session.drawing.add_collaborator(collab)
    self.next_scene("setting_scene")
  end

  def prompt_collaborator
    CliRenderer.print_attribute_list(user_list, :name)
    CliRenderer.print_header("Choose User by Index:")
    collaborator = gets.chomp

    binding.pry
    if (collaborator.to_i > 0)
      if (user_list[collaborator.to_i - 1])
        user_list[collaborator.to_i - 1]
      else
        CliRenderer.print_invalid_input
        prompt_collaborator
      end
    else
      CliRenderer.print_invalid_input
      prompt_collaborator
    end
  end

  private def user_list
    User.all.select { |user| user != self.session.user }
  end
end
