# Create some Toppings for each Burger Object
Topping.create(:name => "pickles", :calories => 35, :price => 1)
Topping.create(:name => "onions", :calories => 30, :price => 1)
Topping.create(:name => "avacado", :calories => 80, :price => 1)
Topping.create(:name => "bacon", :calories => 240, :price => 1)
Topping.create(:name => "beef patty", :calories => 940, :price => 6)
Topping.create(:name => "ahi tuna patty", :calories => 540, :price => 9)
Topping.create(:name => "black bean patty", :calories => 240, :price => 4)
Topping.create(:name => "boca patty", :calories => 280, :price => 6)
Topping.create(:name => "turkey patty", :calories => 680, :price => 6)

# Create some Burgers for the Default List
Burger.create(:name => "Joe's Pitch n Put")
Burger.create(:name => "Fred's Ahi Yum Yum")
