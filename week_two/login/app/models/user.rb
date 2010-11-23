class User < ActiveRecord::Base
    # presence = is something there, not empty
    # uniqueness = not more than one name / object
    validates :username, :presence => true, :uniqueness => true
end
