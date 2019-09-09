class Drawing < ActiveRecord::Base
  has_many :shapes
  has_many :users, through: :user_drawing 
end
