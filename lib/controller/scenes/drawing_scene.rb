class DrawingScene < Scene
  def run
    self.session.drawing.open_drawing
    self.next_scene("setting_scene")
  end
end
