class LoginScene < Scene
  def run
    current_user = nil
    name = CliRenderer.prompt_user_name
    if User.user_exist?(name.upcase)
      current_user = User.find_by(name: name.upcase)

      @session.drawings = current_user.drawings
    else
      current_user = User.create(name: name.upcase)
      CliRenderer.prompt_new_user(name)
    end
    @session.user = current_user
    @session
  end
end
