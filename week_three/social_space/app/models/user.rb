class User < ActiveRecord::Base
    
    # Link each user to one User Profile
    has_one    :user_profile
    
    # Link each user to their reviews
    has_and_belongs_to_many    :reviews
    
    # We can find all comments by a user through Review which has comments
    has_many    :replies, :through => :reviews, :source => :comments
    
    # run some code before the user is saved
    before_save    :update_username
    
    # run some code right after the user is saved
    after_save    :total_users
    
    # Validations
    validates    :username, :presence => true, :uniqueness => true
    validates    :password, :presence => true
    validates    :email_address, :uniqueness => true, :presence => true, 
                   :length => {:within => 5..50},
                   :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i}
                   
    # Example Errors
    #=> #<User id: nil, username: nil, password: nil, created_at: nil, updated_at: nil, email_address: nil>
    #>> u.errors
    #=> #<OrderedHash {:email_address=>["can't be blank", "is too short (minimum is 5 characters)", "is invalid"], :password=>["can't be blank"], :username=>["can't be blank"]}>
    
    def update_username
        # This will be fired right before the data is saved
       puts "USERNAME: #{self.encrypt(self.username)}" 
    end
    
    def total_users
        puts "Total Users: #{User.all.count}"
    end
    
    #>> u = User.create(:username => "scott", :password => "chores", :email_address => "scott@nf.com")
    #USERNAME: 625600233cb3bcab32268c17610882e0fdaed295
    #Total Users: 3
    
    protected
    
    # Create a way for the username to become encrypted
    
    def encrypt(val)
        #Usage self.encrypt(val)
       return Digest::SHA1.hexdigest(val.to_s) 
    end
    
end
