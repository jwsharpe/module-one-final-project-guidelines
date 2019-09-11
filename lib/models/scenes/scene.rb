class Scene
  attr_accessor :method, :session

  def initialize(session)
    @method = method
    @session = session
  end

  def run
    self.send(@method)
  end
end # end of class
