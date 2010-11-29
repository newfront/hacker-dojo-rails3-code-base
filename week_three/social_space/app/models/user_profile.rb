class UserProfile < ActiveRecord::Base
    
    # Link to a User
    belongs_to    :user
    
end
