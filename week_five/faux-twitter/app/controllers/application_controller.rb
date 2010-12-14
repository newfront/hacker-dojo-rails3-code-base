class ApplicationController < ActionController::Base
    protect_from_forgery

    before_filter   :check_title


    protected

    # If no one remembered the page title, no worries
    def check_title
        @page_title = "FauxTwitter"
    end



end