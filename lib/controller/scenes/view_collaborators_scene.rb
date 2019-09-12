class ViewCollaboratorsScene < Scene
  def run
    binding.pry
    CliRenderer.print_attribute_list(user_list, :name)
    CliRenderer.back_and_end_prompt
    program_choice = gets.chomp
    case program_choice
    when "b"
      next_scene("setting_scene")
    when "e"
      next_scene("exit_scene")
    else
      CliRenderer.print_invalid_input
      prompt_collaborator
    end
  end

  private def user_list
    list = session.drawing.collaborators
    list.select { |user| user != session.user }
  end
end
