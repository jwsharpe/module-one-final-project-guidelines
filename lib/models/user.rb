class User < ActiveRecord::Base
    has_many :drawings, through: :user_drawings


    def self.check_user(userName)
        User.all.each do |user| 
            if user.name == userName 
                return true 
            else
                puts "Create New User?"
            end
        end
    end
end
