class User < ActiveRecord::Base
    has_many :user_drawings
    has_many :drawings, through: :user_drawings

  def self.user_exist?(userName)
    User.find_by_name(userName) != nil
  end

  def private_drawings
    puts "Private Drawing"
    self.drawings
  end

  def hello
    puts "checking method"
  end

  def create_drawing(drawing_title)
    new_drawing = Drawing.create(title: drawing_title)
    UserDrawing.create(user_id: self.id, drawing_id: new_drawing.id)
  end

  def collaborative_drawings
  end
end
