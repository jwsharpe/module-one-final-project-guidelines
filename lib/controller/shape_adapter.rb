class ShapeAdapter
  include Renderable
  def self.build(db_shape)
    temp = Square.new(
      x: db_shape.x,
      y: db_shape.y,
      size: db_shape.size,
    )
    color = Color.new(db_shape.color)
    temp.color = color
  end

  def self.build_shape_from_cursor(cursor, drawing)
    build(drawing.shapes.create(
      x: cursor.x,
      y: cursor.y,
      size: cursor.size,
      color: cursor.selected_color,
    ))
  end
end
