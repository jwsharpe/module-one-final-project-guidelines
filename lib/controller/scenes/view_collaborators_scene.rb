class ViewCollaboratorsScene < Scene
  def run
    binding.pry
    CliRenderer.print_attribute_list(session.drawing.collaborators, :name)
    puts "b: Go Back"
    program_choice = gets.chomp
    case program_choice
    when "b"
      next_scene("setting_scene")
    else
      run
    end
  end
end
