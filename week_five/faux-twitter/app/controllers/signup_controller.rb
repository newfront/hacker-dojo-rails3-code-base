class SignupController < ApplicationController
    def new
        # get
        # User.new
        #User(id: integer, username: string, password: string, email: string, created_at: datetime, updated_at: datetime)
        @user = User.new
    end

    def create
        #Parameters: {"utf8"=>"✓", "authenticity_token"=>"f25nQNcu2rDOzfzaa20si99EF+z29cMivczsr1p0fos=", 
        #"user"=>{"username"=>"scotthaines", 
        #"password"=>"[FILTERED]", 
        # "email"=>"scott@convorelay.com"}, "commit"=>"Sign Up"}
        if params[:commit] == "Sign Up"
            # We know the user actually pressed a button to get here
            @user = User.new(params[:user])
            if @user.save
                flash[:notice] = "Horray. You have completed your Signup. We were able to Save your Account."
                redirect_to home_path
            else
                if @user.errors
                    render :action => :new
                end 
            end
        end

    end
end