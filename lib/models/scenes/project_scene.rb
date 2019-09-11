class ProjectScene < Scene
  def run
    CliRenderer.print_privacy_header(session.privacy_setting.upcase)
    drawings = session.drawings.where(private: session.privacy_setting)
    CliRenderer.print_attribute_list(drawings, :title)

    if (session.privacy_setting != "collaborative")
      CliRenderer.print_create_drawing
    end

    program_choice = gets.chomp
    if program_choice == "+" && @session.privacy_setting != "collaborative"
      new_title = CliRenderer.prompt_new_project
      session.drawing = session.user.drawings.create(
        title: new_title,
        private: session.privacy_setting,
      )

      self.next_scene("setting_scene")
    elsif (program_choice.to_i > 0)
      if (drawings[program_choice.to_i - 1])
        session.drawing = drawings[program_choice.to_i - 1]
        self.next_scene("setting_scene")
      else
        CliRenderer.print_header("Choose Existing Project By Index!")
        run
      end
    else
      CliRenderer.print_invalid_input
      run
    end
  end
end
