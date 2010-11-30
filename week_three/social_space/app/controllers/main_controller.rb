class MainController < ApplicationController
  def index
      session[:name] = "page_name"
      @page = session[:name]
  end

end
