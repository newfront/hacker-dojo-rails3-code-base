class MainController < ApplicationController
  #layout 'cool'
  
  def index
    # Welcome Screen
    # Get People In, Have them view some recent tweets or
    # sign up to write some of their own
    
    # If notices, let the user know
    # flash[:notice]
  end
  
  def find_me_info
      # add information into the page dynamically at run time
      # the_info goes into the partial
      the_info = params[:what_info] if params[:what_info].is_a? String
      
      @status = UserStatus.find(the_info)
      #render :text => "Last Tweet : #{@status.status_update}"
      
      # the partial is rendered out using the local variable from the parameters params[:what_info]
      #render :text => @status.status_update
      render :partial => '/partials/add_content_now', :locals =>{:my_info => @status}
      
  end

end
