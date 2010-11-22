class Topping < ActiveRecord::Base
    #Topping(id: integer, name: string, calories: integer, price: integer, created_at: datetime, updated_at: datetime)
    has_and_belongs_to_many    :burgers
end
