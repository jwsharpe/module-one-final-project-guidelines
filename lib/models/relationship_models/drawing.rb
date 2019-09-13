class Drawing < ActiveRecord::Base
  has_many :shapes, dependent: :destroy
  has_many :user_drawings
  has_many :users, through: :user_drawings

  def open
    Window.open(self)
  end

  def self.public_drawings
    self.all.where(private: "public")
  end

  def add_collaborator(user)
    user.drawings << self
    self.update(private: "collaborative")
  end

  def remove_collaborator(user)
    user.drawings.delete(self)
    self.update(private: "private")
  end

  def collaborators
    self.users
    #binding.pry
  end
end
