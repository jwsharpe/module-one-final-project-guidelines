class DrawingWindow < Window
  @@close_flag = 0

  def self.open_drawing(drawing)
    @@close_flag = 0
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
      Window.close if @@close_flag == 1
    end

    show
  end

  def self.load_shapes(drawing)
    drawing.shapes.each { |shape|
      ShapeAdapter.build(shape)
    }
  end

  def self.refresh(shape)
    remove(shape)
    add(shape)
  end

  def self.close_window
    self.clear
    sleep(1)
    @@close_flag = 1
  end
end
