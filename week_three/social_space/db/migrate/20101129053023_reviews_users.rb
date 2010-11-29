class ReviewsUsers < ActiveRecord::Migration
    def self.up
        # Create a user to reviews lookup table
        # Each User has_and_belongs_to_many Reviews
        create_table :reviews_users, :id => false do |t|
            t.references    :user
            t.references    :review
        end
    end

    def self.down
        drop_table  :reviews_users
    end
end
