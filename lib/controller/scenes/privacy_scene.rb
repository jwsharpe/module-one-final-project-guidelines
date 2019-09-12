class PrivacyScene < Scene
  def run
    CliRenderer.print_privacy_options
    option = gets.chomp

    case option
    when "1"
      session.privacy_setting = "private"
    when "2"
      session.privacy_setting = "public"
    when "3"
      session.privacy_setting = "collaborative"
    else
      CliRenderer.print_invalid_input
      run
    end

    self.next_scene("project_scene")
  end
end
