class SettingScene < Scene
  def run
    session.privacy_setting = session.drawing.private
    CliRenderer.print_header("Project: #{session.drawing.title}")
    program_choice = CliRenderer.prompt_program_choice
    case program_choice
    when "1"
      CliRenderer.print_header("Opening Projects...")
      self.next_scene("drawing_scene")
    when "2"
      CliRenderer.print_header("Terminating Projects...")
      session.drawing.destroy
      self.next_scene("project_scene")
    when "3"
      self.next_scene("collaborator_scene")
    when "4"
      if (session.privacy_setting == "collaborative")
        self.next_scene("view_collaborators_scene")
      else
        CliRenderer.print_invalid_input
        run
      end
    when "b"
      self.next_scene("project_scene")
    when "e"
      self.next_scene("exit_scene")
    else
      CliRenderer.print_invalid_input
      run
    end
  end
end
