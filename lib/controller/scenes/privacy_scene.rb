class PrivacyScene < Scene
  def run
    CliRenderer.print_privacy_options
    print "Option: "
    option = gets.chomp

    case option
    when "1"
      session.privacy_setting = "private"
      self.next_scene("project_scene")
    when "2"
      session.privacy_setting = "public"
      self.next_scene("project_scene")
    when "3"
      session.privacy_setting = "collaborative"
      self.next_scene("project_scene")
    when "b"
      self.next_scene("login_scene")
    when "e"
      self.next_scene("exit_scene")
    else
      CliRenderer.print_invalid_input
      run
    end
  end
end
