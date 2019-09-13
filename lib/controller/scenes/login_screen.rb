class LoginScene < Scene
  def run
    CliRenderer.print_greeting # welcome message 
    CliRenderer.print_header("LOGIN: Enter User Name")
    name = CliRenderer.prompt_user_by_choice("Username") # return user input(username)

    if User.user_exist?(name.upcase)
      current_user = User.find_by(name: name.upcase) # return user
      CliRenderer.greet_returning_user(name)
      @session.drawings = current_user.drawings
    else
      current_user = User.create(name: name.upcase)
      CliRenderer.greet_new_user(name)
      #what if we pass empty array here to session.drawings [ to fix reference to nil drawings]
    end
    session.user = current_user
    self.next_scene("privacy_scene")
  end
end
