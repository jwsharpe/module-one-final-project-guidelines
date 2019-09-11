class Cursor < Square
  attr_accessor :selected_color

  COLORS = ["blue", "green", "red", "yellow", "white", "black", "purple"]

  def initialize
    super(
      x: (Window.width - 20) / 2 - 10,
      y: (Window.height - 20) / 2 - 10,
      size: 50,
      color: COLORS[0],
    )
    @color_index = 0
    @selected_color = COLORS[@color_index]
  end

  def move(x:, y:)
    self.x += x
    self.y += y
  end

  def size
    super
    if (@size <= 10)
      @size = 10
    end
    @size
  end

  def cycle_color
    @color_index = (@color_index + 1) % COLORS.length

    self.color = COLORS[@color_index]
    self.selected_color = COLORS[@color_index]
  end
end
