class User < ActiveRecord::Base
    has_many :user_drawings
    has_many :drawings, through: :user_drawings

  def self.user_exist?(userName)
    User.find_by_name(userName) != nil
  end

  def private_drawings
    puts "Private Drawing"
    self.drawings.where(private == true)
  end

  def hello
    puts "checking method"
  end

  def create_private_drawing(drawing_title)
    self.drawing.create(title: drawing_title, private: true)
  end

  def create_public_drawing(drawing_title)
    self.drawings.create(title: drawing_title, private: false)
  end


  def collaborative_drawings
  end
end
