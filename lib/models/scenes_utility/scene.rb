class Scene
  attr_accessor :method, :session

  def initialize
    @method = method
    @session = session
  end

  def run
    self.send(@method)
  end

  def next_scene(scene)
    @session.scene_id = scene
    @session
  end
end # end of class
