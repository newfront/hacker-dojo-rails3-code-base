class CreateUserProfiles < ActiveRecord::Migration
  def self.up
    create_table :user_profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.datetime :birthdate
      t.string :twitter
      t.text :biography

      t.timestamps
    end
  end

  def self.down
    drop_table :user_profiles
  end
end
