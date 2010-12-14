class CreateUserStatuses < ActiveRecord::Migration
  def self.up
    create_table :user_statuses do |t|
      t.integer :user_id
      t.text :status_update
      t.datetime :pub_date

      t.timestamps
    end
  end

  def self.down
    drop_table :user_statuses
  end
end
