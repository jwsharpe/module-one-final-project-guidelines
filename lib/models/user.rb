class User < ActiveRecord::Base
    has_many :drawings, through: :user_drawings


    def self.check_user(usernName)
        User.all.each { |user| user.name == userName ? true : false }
    end
end
