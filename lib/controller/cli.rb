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
    exit_scene = ExitScene.new

    cli_scene_manager.add_scene(login_scene)
    cli_scene_manager.add_scene(privacy_scene)
    cli_scene_manager.add_scene(projects_scene)
    cli_scene_manager.add_scene(settings_scene)
    cli_scene_manager.add_scene(collaborator_scene)
    cli_scene_manager.add_scene(drawing_scene)
    cli_scene_manager.add_scene(exit_scene)

    cli_scene_manager.show
  end
end
