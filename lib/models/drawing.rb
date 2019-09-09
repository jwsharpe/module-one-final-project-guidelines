class Drawing < ActiveRecord::Base
  has_many :shapes

  def open
    Window.open(self)
  end
end
