class UserController < ApplicationController
    def index
        #/user
        # list all users
        @users = User.find(:all,:conditions=>{},:limit => 10)
    end

    def show
        #/user/1
        # check you session, is this you?
        if session[:user]
            #render :inline => "This user is in session #{session[:user]["username"]}"
        end
    end

    def edit
        #/user/1/edit
    end

    def destroy
        #/user/1/destroy
    end

end
