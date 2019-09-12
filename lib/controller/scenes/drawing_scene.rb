class DrawingScene < Scene
  def run
    self.session.drawing.open
    self.next_scene("setting_scene")
  end
end
