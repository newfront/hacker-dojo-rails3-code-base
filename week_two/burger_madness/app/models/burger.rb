class Burger < ActiveRecord::Base
    #Burger(id: integer, name: string, created_at: datetime, updated_at: datetime)
    has_and_belongs_to_many    :toppings
    belongs_to    :order
    
    # make sure that the Burger name field isn't blank
    validates     :name, :presence => true, :uniqueness => true
    
    @@price = 0
    
    # Calculate the price of the Burger
    # Recalculate price since price can change depending on number of toppings
    def get_price
        @@price = 0
        self.toppings.each {|topping| @@price += topping.price}
        #puts "Total Burger Price: $#{@price}"
        return @@price
    end
end
