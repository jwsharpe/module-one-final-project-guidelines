class Cli
  def run_program
    CliRenderer.print_greeting # greet msg
    session = Session.new

    login_scene = Scene.new(:login, session)
    project_groups_scene = Scene.new(:project_groups, session)
    select_project_scene = Scene.new(:select_project, session)

    session = login_scene.run # return user
    session = project_groups_scene.run # return string e.i. "private"
    session = select_project_scene.run
    binding.pry
    # drawings = list_project(session) # return array of drawing'
    # session.drawing = select_project(drawings, session, util) # return a selected drawing
    # list_drawing_setting(session, util)
  end
end
