class SessionController < ApplicationController
    def new
        #User(id: integer, username: string, password: string, email: string, created_at: datetime, updated_at: datetime)
        # attempt to log a user in
        @user = User.new
    end

    def create
        # after a user has been checked out, send them here to initiate their session

        # Check to see if the user exists in the database?
        # Do they? If not, send them to our Sign up Page

        #Parameters: {"utf8"=>"✓", "authenticity_token"=>"f25nQNcu2rDOzfzaa20si99EF+z29cMivczsr1p0fos=", 
        #"user"=>{"username"=>"matt", "password"=>"[FILTERED]"}, "commit"=>"Log In"}

        if params[:commit] == "Log In"
            @current = u = User.find_by_username_and_password(params[:user][:username],params[:user][:password])
            if @current.is_a? User
                # Start Saving Session Info for the User
                puts params[:user].inspect
                session[:user] = {}
                session[:user]["username"] = @current["username"] if !@current["username"].nil?
                session[:user]["is_active"] = true
                session[:user]["email"] = @current["email"]
                session[:user]["id"] = @current[:id]
                flash[:notice] = "logged in sucessfully"
                redirect_to user_path(@current[:id])
            else
               flash[:error] = "Your Username and/or Password is incorrect"
               render :action => "new" 
            end
        else
            flash[:error] = "You need to login with our forms, don't try and hack the system"
            redirect_to signup_path 
        end
    end

    def destroy
        # want to log a user back out again
        # send them here to kill their session
        if session[:user]
           session[:user] = nil
           flash[:notice] = "You have been logged out."
           redirect_to home_path 
        end
    end

end
