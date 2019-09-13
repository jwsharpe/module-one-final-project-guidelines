class DrawingScene < Scene
  def run
    self.session.drawing.open_drawing
    sleep(5)
    self.next_scene("setting_scene")
  end
end
