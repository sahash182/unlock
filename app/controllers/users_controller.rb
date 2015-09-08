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
    if current_user
      @user = current_user
    else
      @user = User.find(params[:id]) 
    end
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

  def status

    @user = current_user
    if status_params[:status]
      @user.update_attributes(status_params)
      render json: @user
    else
      @user.update_attributes(status_params)
      render json: @user
    end
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :status, :image, :info, :role, :password)
  end	

  def status_params
    params.require(:user).permit(:status)
  end

end
