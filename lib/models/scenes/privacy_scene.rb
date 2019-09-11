class PrivacyScene < Scene
  def run
    CliRenderer.print_privacy_options
    option = gets.chomp

    case option
    when "1"
      session.privacy_setting = "private"
      session
    when "2"
      session.privacy_setting = "public"
      session
    when "3"
      session.privacy_setting = "collaborative"
      session
    else
      CliRenderer.print_invalid_input
      session = self.run
    end
  end
end
