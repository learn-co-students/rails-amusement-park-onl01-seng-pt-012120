class UsersController < ApplicationController
    before_action :set_user, only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        
        if !logged_in?
            redirect_to '/'
        end
    end


    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end

end
