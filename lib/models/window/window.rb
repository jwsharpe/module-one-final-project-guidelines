class Window
  def self.open(drawing)
    load_shapes(drawing)

    cursor = Cursor.new
    gamepad = Gamepad.new

    on :controller_button_down do |event|
      if (event.button)
        new_shape = drawing.shapes.create(
          x: cursor.x,
          y: cursor.y,
          color: "red",
        )

        Square.new(
          x: new_shape.x,
          y: new_shape.y,
          color: new_shape.color,
        )
      end
    end

    on :controller_axis do |event|
      gamepad.update_digital_output(event)
    end

    update do
      cursor.move(
        x: gamepad.digital_output_x,
        y: gamepad.digital_output_y,
      )
    end

    show
  end

  def self.load_shapes(drawing)
    drawing.shapes.each { |shape|
      Square.new(
        x: shape.x,
        y: shape.y,
        color: shape.color,
      )
    }
  end
end
