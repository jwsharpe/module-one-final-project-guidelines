class Window
  @@close_flag = 0

  def self.open(drawing)
    load_shapes(drawing)
    set title: drawing.title
    cursor = Cursor.new
    gamepad = GamepadHandler.new

    on :controller_button_down do |event|
      case event.button
      when :start
        close_window
      when :up
        cursor.size += 20
      when :down
        cursor.size -= 20
      when :y
        cursor.cycle_color
      when :a
        ShapeAdapter.build_shape_from_cursor(cursor, drawing)
        refresh(cursor)
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
    Window.close if @@close_flag == 1
  end

  def self.refresh(shape)
    remove(shape)
    add(shape)
  end

  def self.close_window
    self.clear
    @@close_flag = 1
  end
end
