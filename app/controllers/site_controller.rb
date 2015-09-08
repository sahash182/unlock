class SiteController < ApplicationController

  def index
	@user = User.where(status: 'active')
  	render :index	
  end
  
end
