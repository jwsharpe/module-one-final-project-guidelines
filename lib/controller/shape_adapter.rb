class ShapeAdapter
  include Renderable
  def self.build(db_shape)
    Square.new(
      x: db_shape.x,
      y: db_shape.y,
      color: db_shape.color,
      size: db_shape.size,
    )
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
