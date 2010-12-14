class CreateUserAdditionalProfiles < ActiveRecord::Migration
  def self.up
    create_table :user_additional_profiles do |t|
      t.string :full_name
      t.datetime :birthday
      t.string :twitter
      t.integer :background
      t.integer :theme
      t.timestamps
    end
  end

  def self.down
    drop_table :user_additional_profiles
  end
end
