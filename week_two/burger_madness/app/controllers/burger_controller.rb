class BurgerController < ApplicationController
    def index
        redirect_to :action => :new
    end

    def show
    end

    def new
        @burger = Burger.new
        @title = "Create a new Burger"
    end

    def create
        #Create new Burger Record
        @burger = Burger.new(params[:burger])

        respond_to do |format|
          if @burger.save
            format.html { redirect_to :action => "add_topping", :id => @burger.id, :notice => 'Burger Started.'}
          else
            format.html { render :action => "new"}
            puts "Errors. #{@burger.errors.inspect}"
          end
        end
        
    end

    def edit
    end

    def destroy
    end
    
    def add_topping
        @burger = Burger.find(params[:id])
        @topping = Topping.all
        if @burger
            @burger_id = params[:id]
        else
           redirect_to :action => :new 
        end
    end
    
    def do_add_topping
        @burger = Burger.find(params[:id])
        @burger.toppings << Topping.find(params[:toppings])
        
        if @burger.save
            redirect_to :action => "add_topping", :id => @burger.id, :notice => 'Burger Topping Saved'
        else
            redirect_to :action => "add_topping", :id => @burger.id, :notice => 'Burger Topping Failed to Save'
        end
    end

end
