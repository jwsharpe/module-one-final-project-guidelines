class ProjectScene < Scene
  def run
    CliRenderer.print_privacy_header(@session.privacy_setting.upcase)
    drawings = session.drawings.where(private: session.privacy_setting)
    CliRenderer.print_attribute_list(drawings, :title)

    if (@session.privacy_setting != "collaborative")
      CliRenderer.print_create_drawing
    end

    program_choice = gets.chomp
    if program_choice == "+" && @session.privacy_setting != "collaborative"
      title = CliRenderer.prompt_new_project
      @session.user.drawings.create(
        title: new_title,
        private: session.privacy_setting,
      )
      puts "NEED TO REFERENCE MANAGER"
    elsif (program_choice.to_i > 0)
      if (drawings[program_choice.to_i - 1])
        @session.drawing = drawings[program_choice.to_i - 1]
        @session
      else
        CliRenderer.print_header("Choose Existing Project By Index!")
        @session = self.run
      end
    else
      CliRenderer.print_invalid_input
      @session = self.run
    end
  end
end
