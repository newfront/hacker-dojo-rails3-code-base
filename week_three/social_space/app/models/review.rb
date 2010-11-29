class Review < ActiveRecord::Base
    
    # Link each Review to a User 
    has_and_belongs_to_many    :users
    
    has_many   :comments
    
end
