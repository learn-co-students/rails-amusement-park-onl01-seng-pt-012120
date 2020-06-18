class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to user_path(current_user)
    else
      @users = User.all
    end
  	
  end

  def create
  	@user = User.find_by(id: user_params[:name])

  	if @user && @user.authenticate(user_params[:password])
  		session[:user_id] = @user.id

  		redirect_to user_path(@user)
  	else
  		redirect_to signin_path
  	end
  end

  def destroy
  	reset_session
  	redirect_to root_path
  end

  private

  def user_params
  	# params[:user][:user_id] = params[:user].delete(:name)
  	params.require(:user).permit(:name, :password)
  end

end
