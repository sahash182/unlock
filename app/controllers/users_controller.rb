class UsersController < ApplicationController
  def new
  	@user = User.new
  	render :new
  end

  def create
   user = User.new(user_params)
   if user.save
    session[:user_id] = user.id
    redirect_to user_path(user)
   else
    flash[:error] =  user.errors.full_messages
    redirect_to signup_path

   end
  end

  def show
  	@current_user = User.find(params[:id]) 
    render :show
  end

  def edit
    @user = User.find(params[:id])
    render :edit    
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to profile_path

  end


    private 
    def set_user
      @user = User.find(params[:id])
    end

  def user_params
    params.require(:user).permit(:username, :email, :image, :info, :password)
  end	

end
