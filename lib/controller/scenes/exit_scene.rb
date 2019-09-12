class ExitScene < Scene
  def run
    CliRenderer.print_goodbye
    self.next_scene("out")
  end
end
