class StatusController < ApplicationController
    
    def new
        #only if you are loggedin
        unless session[:user]
           redirect_to home_path 
        end
        @status = UserStatus.new
    end

    def create
        #render :inline => "Good Job, Twitting away"
        @user = User.find(session[:user]["id"])
        if @user.is_a? User
            if @user.user_statuses << UserStatus.create(:status_update => params["user_status"]["status_update"]) 
                flash[:notice] = "Tweet was saved"
                redirect_to user_path(@user.id)
            else
               flash[:error] = "Tweet wasn't saved."
               redirect_to :action => :new 
            end
        else
            flash[:error] = "Some issue here..."
           redirect_to :action => :new 
        end
    end

    def show
    end

    def edit
    end

    def destroy
    end

end
