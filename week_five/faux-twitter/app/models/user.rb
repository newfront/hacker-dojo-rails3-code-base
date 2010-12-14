class User < ActiveRecord::Base
    #User(id: integer, username: string, password: string, email: string, created_at: datetime, updated_at: datetime)
    
    validates :username, :presence => true
    validates :username, :uniqueness => true
    validates :email, 
        :length => {:minimum => 3, :maximum => 254},
        :uniqueness => true,
        :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
        
    has_many  :user_statuses
end
