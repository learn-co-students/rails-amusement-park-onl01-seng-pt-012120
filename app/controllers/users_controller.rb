class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    if logged_in?
      @user = current_user
    else
      redirect_to root_path
    end
  end

  def update
    @attraction = Attraction.find_by(id: params[:user][:attraction_id])
    @user = current_user
    @ride = Ride.new
    @ride.user = @user
    @ride.attraction = @attraction
    @ride.save
    flash[:alert] = @ride.take_ride
    redirect_to user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end
end 