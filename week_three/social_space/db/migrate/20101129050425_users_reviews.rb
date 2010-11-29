class UsersReviews < ActiveRecord::Migration
    def self.up
        # Create a user to reviews lookup table
        # Each User has_and_belongs_to_many Reviews
        create_table :users_reviews, :id => false do |t|
            t.references    :user
            t.references    :review
        end
    end

    def self.down
        drop_table  :users_reviews
    end
end