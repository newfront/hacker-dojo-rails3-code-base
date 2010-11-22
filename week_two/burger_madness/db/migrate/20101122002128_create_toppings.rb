class CreateToppings < ActiveRecord::Migration
  def self.up
    create_table :toppings do |t|
      t.string :name
      t.integer :calories
      t.integer :price

      t.timestamps
    end
  end

  def self.down
    drop_table :toppings
  end
end
