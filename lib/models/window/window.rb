class Window
  def self.open(drawing)
    load_shapes(drawing)
    set title: drawing.title
    cursor = Cursor.new
    gamepad = GamepadHandler.new

    on :controller_button_down do |event|
      case event.button
      when :up
        cursor.size += 20
      when :down
        cursor.size -= 20
      when :y
        cursor.cycle_color
      when :a
        ShapeAdapter.build_shape_from_cursor(cursor, drawing)
        remove(cursor)
        add(cursor)
      else
        p event.button
      end
    end

    on :controller_axis do |event|
      gamepad.update_controller_axis_digital_output(event)
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
      ShapeAdapter.build(shape)
    }
  end
end
