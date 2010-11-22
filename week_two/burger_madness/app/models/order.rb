class Order < ActiveRecord::Base
    #Order(id: integer, burgers_id: integer, price: integer, created_at: datetime, updated_at: datetime)
    has_one    :burger
end
