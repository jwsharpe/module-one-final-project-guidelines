class SettingScene < Scene
  def run
    CliRenderer.print_header(
      "1 -> Open Project (Edit)",
      "2 -> Delete Project",
      "3 -> Add Collaborator"
    )
    program_choice = gets.chomp
    case program_choice

    when "1"
      CliRenderer.print_header("Opening Projects...")
      puts "PLEASE CALL THE SCENE MANAGER ON AISLE 5"
    when "2"
      CliRenderer.print_header("Terminating Projects...")
      session.drawing.destroy
    when "3"
      #We want to call some SceneManager Thing?
    else
      CliRenderer.print_invalid_input
      run
    end
  end
end
