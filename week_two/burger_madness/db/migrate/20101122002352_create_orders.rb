class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :burgers_id
      t.integer :price

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
