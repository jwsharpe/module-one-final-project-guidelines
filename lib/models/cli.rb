class Cli
  def run_program
    cli_scene_manager = SceneManager.new

    CliRenderer.print_greeting # greet msg
    login_scene = LoginScene.new
    privacy_scene = PrivacyScene.new
    projects_scene = ProjectScene.new
    settings_scene = SettingScene.new
    collaborator_scene = CollaboratorScene.new
    drawing_scene = DrawingScene.new

    cli_scene_manager.add_scene(login_scene)
    cli_scene_manager.add_scene(privacy_scene)
    cli_scene_manager.add_scene(projects_scene)
    cli_scene_manager.add_scene(settings_scene)
    cli_scene_manager.add_scene(collaborator_scene)
    cli_scene_manager.add_scene(drawing_scene)

    cli_scene_manager.show

    # session = login_scene.run # return user
    # session = privacy_scene.run # return string e.i. "private"
    # session = projects_scene.run
    # session = settings_scene.run
    # session = collaborator_scene.run
    # binding.pry
  end
end




