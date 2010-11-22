class OrderController < ApplicationController
    def index
        @orders = Order.find(:all, :limit => 5)
        @page_title = "Orders"
    end
    
    def new
       @order = Order.new
       @burger = Burger.find(params[:id]) 
    end
    
    def show
        # Show 5 most recent orders
        @orders = Order.all
        
        # Show Orders Based on Rules
        # if no parameter id, or with parameter id if params[:id].is_a? String (all), or Integer
        if params[:id]
            puts "Has Parameter"
            if params[:id] == "all"
                # List Orders
                puts "Show ALL"
                @page_title = "History"
            else
                # Show a single Record based off of this id
                puts "Show Single Record"
                @page_title = "Orders"
            end
        else
            # show all
        end
    end
    
    def create
        @order = Order.new
        @burger = Burger.find(params[:id])
        @order.burgers_id = @burger.id
        @order.price = @burger.get_price
        
        if @order.save
            @burger.order_id = @order.id
            @burger.save
            redirect_to :action => :index, :notice => "Order has been placed"
        else
            redirect_to :action => :index, :notice => "Order couldn't be saved"
        end
    end

end