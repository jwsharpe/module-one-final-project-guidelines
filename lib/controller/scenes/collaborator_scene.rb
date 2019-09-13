class CollaboratorScene < Scene
  def run
    CliRenderer.print_header("Select Collaborator")
    collab = prompt_collaborator
    session.drawing.add_collaborator(collab)
    self.next_scene("setting_scene")
  end

  def prompt_collaborator
    CliRenderer.print_attribute_list(user_list, :name)
    CliRenderer.print_back_and_end
    collaborator = CliRenderer.prompt_user_by_choice("Choose User by Index")

    case collaborator
    when "b"
      next_scene("project_setting")
    when "e"
      next_scene("exit_scene")
    else
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
  end

  private def user_list
    User.all.select { |user|
      !session.drawing.collaborators.reload.any? { |collab|
        collab == user
      }
    }
  end
end
