class UsersController < ApplicationController
    layout "application"
    before_action :require_login, only: [:show, :update]
    before_action :user_layout, only: [:home]

    def home
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :nausea, :tickets, :happiness, :admin, :password)
    end

    def require_login
        redirect_to '/' unless session.include? :user_id
    end
end