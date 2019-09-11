class Cli
  def run_program
    CliRenderer.print_greeting # greet msg
    cli_scene_manager = SceneManager.new

    session = Session.new
    login_scene = LoginScene.new(session)
    privacy_scene = PrivacyScene.new(session)
    projects_scene = ProjectScene.new(session)
    settings_scene = SettingScene.new(session)
    collaborator_scene = CollaboratorScene.new(session)

    # cli_scene_manager.add_scene(login_scene)
    # cli_scene_manager.add_scene(privacy_scene)
    # cli_scene_manager.add_scene(projects_scene)
    # cli_scene_manager.add_scene(settings_scene)

    # cli_scene_manager.show

    session = login_scene.run # return user
    session = privacy_scene.run # return string e.i. "private"
    session = projects_scene.run
    session = settings_scene.run
    session = collaborator_scene.run
    binding.pry

    # session.drawing = select_project(drawings, session, util) # return a selected drawing
    # list_drawing_setting(session, util)
  end
end
