class User < ActiveRecord::Base
  has_many :user_drawings
  has_many :drawings, through: :user_drawings

  def self.user_exist?(userName)
    User.find_by_name(userName) != nil
  end

  def private_drawings
    #puts "Private Drawing"
    self.drawings.where(private: "private")
  end

  def collab_drawings
    self.drawings.where(private: "collaborative")
  end

  def create_private_drawing(drawing_title)
    create_drawing(title: drawing_title, private: "private")
  end

  def create_public_drawing(drawing_title)
    create_drawing(title: drawing_title, private: "public")
  end

  def create_drawing(drawing_title, privacy_setting)
    self.drawings.create(title: drawing_title, private: privacy_setting)
  end
end
