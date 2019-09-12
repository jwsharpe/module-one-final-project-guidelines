class ExitScene < Scene
  def run
    CliRenderer.print_goodbye
    self.session.scene_id = "exeunt"
    self.session
  end
end
