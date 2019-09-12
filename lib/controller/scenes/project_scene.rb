require "pry"

class ProjectScene < Scene
  def run
    CliRenderer.print_privacy_header(session.privacy_setting.upcase)

    scene_handle_greeting
    print "Option: "
    program_choice = gets.chomp

    case program_choice
    when "b"
      self.next_scene("privacy_scene")
    when "e"
      self.next_scene("exit_scene")
    when "+" && !is_collaborative?
      scene_show_create_new_drawing
      self.next_scene("setting_scene")
    else
      if (program_choice.to_i > 0)
        session.drawings[program_choice.to_i - 1]
        scene_save_drawing_to_session_data(session, program_choice)
        self.next_scene("setting_scene")
      else
        CliRenderer.print_invalid_input
        run
      end
    end
  end
end

private

def is_collaborative?
  session.privacy_setting != "collaborative"
end

def scene_show_create_new_drawing
  new_title = CliRenderer.prompt_new_project
  session.drawing = session.user.create_drawing(
    new_title, session.privacy_setting
  )
end

def scene_save_drawing_to_session_data(session, program_choice)
  session.drawing = session.drawings[program_choice.to_i - 1]
end

def scene_handle_greeting
  if session.drawings
    drawings = session.drawings.where(private: session.privacy_setting)
    CliRenderer.print_attribute_list(drawings, :title)
  else
    CliRenderer.print_header("No drawing exist! Create New Or Choose Public")
    CliRenderer.back_and_end_prompt
  end

  CliRenderer.print_create_drawing unless is_collaborative?
end
