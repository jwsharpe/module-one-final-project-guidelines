class Drawing < ActiveRecord::Base
  has_many :shapes, dependent: :destroy
  has_many :users, through: :user_drawing

  def open
    Window.open(self)
  end

  
end
