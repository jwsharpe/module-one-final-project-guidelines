class User_Drawing < ActiveRecord::Base
    belongs_to :user 
    belongs_to :drawing 

    
end
