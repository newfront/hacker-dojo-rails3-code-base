class UsersController < ApplicationController
  def index
      @user = User.new
  end

  def result
      puts "User Data Posted: #{params[:user]}"
      
      @user = params[:user]
      
      @result = User.find_by_username_and_password(@user[:username],@user[:password])
      
      if @result
          puts @result.inspect
         #render :inline => "We Found You. Welcome in."
      else
         #render :inline => "You are not welcome."
         #redirect_to :action => :index
         render :action => :index
      end
      
  end

end
