class ProjectScene < Scene
  def run
    puts "#{@session.privacy_setting.upcase} PROJECTS"
    puts "^" * 90
    drawings = session.drawings.where(private: session.privacy_setting)
    CliRenderer.print_attribute_list(drawings, :title)

    if (@session.privacy_setting != "collaborative")
      puts "+ -> Create New Drawing"
    end

    program_choice = gets.chomp
    if program_choice == "+" && @session.privacy_setting != "collaborative"
      CliRenderer.prompt_new_project(@session)
      @session = self.run
    elsif (program_choice.to_i > 0)
      if (drawings[program_choice.to_i - 1])
        @session.drawing = drawings[program_choice.to_i - 1]
        @session
      else
        CliRenderer.print_header("Choose Existing Project By Index!")
        @session = self.run
      end
    else
      CliRenderer.print_header("Enter Project Index Number!")
      @session = self.run
    end
  end
end
