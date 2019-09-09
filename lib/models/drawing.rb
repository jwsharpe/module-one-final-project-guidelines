class Drawing < ActiveRecord::Base
  has_many :shapes

  def open
    shapes.each { |shape|
      Square.new(
        x: shape.x,
        y: shape.y,
        color: shape.color,
      )
    }

    initialize_cursor

    on :controller_button_down do |event|
      Gamepad.add_shape(event)
    end

    on :controller_axis do |event|
      Gamepad.update_digital_output(event)
    end

    Window.show
  end

  def initialize_cursor
    Cursor.new
  end
end
