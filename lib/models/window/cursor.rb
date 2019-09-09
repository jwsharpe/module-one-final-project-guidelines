class Cursor < Square
  def initialize
    super
    @sprite = Square.new(
      x: (Window.width - 20) / 2 - 10,
      y: (Window.height - 20) / 2 - 10,
      size: 40,
      color: "blue",
    )
  end

  def move(x:, y:)
    self.x += x
    self.y += y
  end
end
