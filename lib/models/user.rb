class User < ActiveRecord::Base
    has_many :drawings, through: :user_drawings


    def self.user_exist?(userName)
        User.find_by_name(userName) != nil 
    end

    

end
