class SiteController < ApplicationController
  def index
  	@user = User.all
  	render :index
  	
  end
end
