class HomeController < ApplicationController
  def index
  	if request.xhr?
  		render :partial => "show_image"
  	end
  end
end
