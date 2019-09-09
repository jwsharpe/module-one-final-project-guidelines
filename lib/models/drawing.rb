class Drawing < ActiveRecord::Base
  has_many :shapes
  has_many :users, through: :user_drawing 
  
  def open
    shapes.each { |shape|
      Square.new(
        x: shape.x,
        y: shape.y,
        color: shape.color,
      )
    }

    initialize_editor

    on :update do
      Cursor.move(
        x: gamepad.digital_output_x,
        y: gamepad.digital_output_y,
      )
    end

    Window.show
  end

  private def initialize_editor
    Cursor.new

    on :controller_button_down do |event|
      if (event.button)
        Square.new(x: user.x, y: user.y, size: 40, color: "red")
      end
    end

    on :controller_axis do |event|
      Gamepad.update_digital_output(event)
    end
  end
  
end
