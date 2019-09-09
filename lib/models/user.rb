class User < ActiveRecord::Base
    has_many :drawings, through: :user_drawings

    def createUser(name)
        User.new(name)
    end
end
