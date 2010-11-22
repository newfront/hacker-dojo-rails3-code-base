class ApplicationController < ActionController::Base
    protect_from_forgery

    before_filter    :web_config

    def web_config
        @title = "Burger Madness"
    end   

  
end
