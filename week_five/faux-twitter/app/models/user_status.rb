class UserStatus < ActiveRecord::Base
    #UserStatus(id: integer, user_id: integer, status_update: text, pub_date: datetime, created_at: datetime, updated_at: datetime)
    
    belongs_to :user
    validates :status_update, :presence => true, :uniqueness => true
end
