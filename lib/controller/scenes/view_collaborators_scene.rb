class ViewCollaboratorsScene < Scene
  def run
    collab = prompt_collaborator
    session.drawing.remove_collaborator(collab)
    self.next_scene("setting_scene")
  end

  def prompt_collaborator
    CliRenderer.print_attribute_list(user_list, :name)
    collaborator = CliRenderer.print_header_with_prompt("Choose User by Index:")
    colab_index = collaborator.to_i
    if (colab_index > 0)
      if (user_list[colab_index - 1])
        user_list[colab_index - 1]
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
