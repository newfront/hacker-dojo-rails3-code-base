class BurgerToppings < ActiveRecord::Migration
    def self.up
        create_table :burgers_toppings, :id => false do |t|
            t.references    :burger
            t.references    :topping
        end
    end
    
    def self.down
        drop_table    :burgers_toppings
    end
end