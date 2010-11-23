class UsernameAddedToUser < ActiveRecord::Migration
    # example next week, migration with auto into table
  def self.up
      add_column :users, :username, :string
  end

  def self.down
      remove_column :users, :username 
  end
end

# rails generate migration username_added_to_user
