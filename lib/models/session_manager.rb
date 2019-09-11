class SceneManager
  attr_accessor :session
  attr_reader :scenes

  def initialize
    @scenes = []
  end

  def add_scene(scene)
    scene.session = self.session
    scenes.push(scene)
  end

  def show
  end
end
