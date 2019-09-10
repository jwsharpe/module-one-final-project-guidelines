class Drawing < ActiveRecord::Base
  has_many :shapes, dependent: :destroy
  has_many :users, through: :user_drawing

  def open
    Window.open(self)
  end

  def self.public_drawings
    self.all.where(private: "public")
  end

  def add_collaborator(user)
    user.drawings << self
  end
end
