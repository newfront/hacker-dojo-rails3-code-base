class AddOrderIdColumnToBurgers < ActiveRecord::Migration
  def self.up
      add_column :burgers, :order_id, :integer
  end

  def self.down
      remove_column :burgers, :order_id
  end
end
