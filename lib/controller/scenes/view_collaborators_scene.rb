class ViewCollaboratorsScene < Scene
  def run
    binding.pry
    CliRenderer.print_attribute_list(session.drawing.collaborators, :name)
    CliRenderer.back_and_end_prompt
    program_choice = gets.chomp
    case program_choice
    when "b"
      next_scene("setting_scene")
      when "e"
        next_scene("exit_scene")
    else
      run
    end
  end
end
