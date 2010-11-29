class User < ActiveRecord::Base
    
    # Link each user to one User Profile
    has_one    :user_profile
    
    # Link each user to their reviews
    has_and_belongs_to_many    :reviews
    
    # We can find all comments by a user through Review which has comments
    has_many    :replies, :through => :reviews, :source => :comments
    
end
