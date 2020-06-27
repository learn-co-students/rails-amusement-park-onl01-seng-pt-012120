class UsersController < ApplicationController

def new
    @user = User.new
end

def create
    @user = User.new(params[:user_params])
    if @user.save
        session[:user_id]= @user.id
      redirect_to user_path(@user), :alert => "you Signed up"
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render "new", :alert => "Please complete the forms"
    end
end


def edit
    @user = User.find(params[:id])
end

def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user), :alert=> "UPDATE!"
    else
        render 'edit', :alert=>"Please complete the forms"
end
end


def ride
    @ride = Ride.new(user_id: current_user.id, attraction_id: params[:format])
    msg = @ride.take_ride
    redirect_to user_path(current_user), :alert => msg
end

def show
    @user = User.find(params[:id])
end

private


# name", "nausea", "happiness", "tickets", "height", "password"

def user_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password_digest, :admin)
  end
end