class SceneManager
  attr_accessor :session
  attr_reader :scenes

  SCENE_NAMES = ["login_scene", "privacy_scene", "project_scene",
                 "setting_scene", "collaborator_scene", "drawing_scene", "exit_scene", "view_collaborators_scene"]

  def initialize
    @session = Session.new
    @scenes = []
  end

  def add_scene(scene)
    scene.session = self.session
    scenes.push(scene)
  end

  def show
    run_scene("login_scene")
  end

  private def run_scene(scene_name)
    sleep(0.7)
    system "clear"
    #CliRenderer.print_spacer
    index = SCENE_NAMES.index(scene_name)
    return if !index
    session = scenes[index].run #can return seasion.scene_id instead of season
    run_scene(session.scene_id)
  end
end
