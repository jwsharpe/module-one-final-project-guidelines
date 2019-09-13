require "pry"

class ProjectScene < Scene
  def run
    User.all.reload
    UserDrawing.all.reload
    Drawing.all.reload

    session.drawings = session.user.drawings.reload #???

    scene_handle_greeting
    program_choice = CliRenderer.prompt_user_by_choice("Option")

    case program_choice
    when "b"
      self.next_scene("privacy_scene")
    when "e"
      self.next_scene("exit_scene")
    when "+"
      if (!is_collaborative?)
        scene_show_create_new_drawing
        self.next_scene("setting_scene")
      else
        CliRenderer.print_invalid_input
        run
      end
    else
      pro_index = program_choice.to_i
      if (pro_index > 0 && !session.drawings[pro_index - 1].nil?)
        scene_save_drawing_to_session_data(session, pro_index - 1)
        self.next_scene("setting_scene")
      else
        CliRenderer.print_invalid_input
        run
      end
    end
  end
end

private

def scene_handle_greeting
  CliRenderer.print_privacy_header(session.privacy_setting)
  CliRenderer.print_border

  privacy_drawings = session.drawings.where(private: session.privacy_setting) rescue []

  if privacy_drawings.any?
    CliRenderer.print_attribute_list(privacy_drawings, :title)
  else
    CliRenderer.print("No drawings exist! Create New or Go Back.")
    CliRenderer.print_border
  end

  CliRenderer.print_create_drawing unless is_collaborative?
  CliRenderer.print_back_and_end
  CliRenderer.print_border
end

def is_collaborative?
  session.privacy_setting == "collaborative"
end

def scene_show_create_new_drawing
  new_title = CliRenderer.prompt_new_project
  session.drawing = session.user.create_drawing(
    new_title, session.privacy_setting
  )
end

def scene_save_drawing_to_session_data(session, index)
  session.drawing = session.drawings.where(private: session.privacy_setting)[index]
end
