class UsersController < ApplicationController
    def home
    end

    def new
    end

    def create
        if params[:user][:name] != "" && params[:user][:password] != ""
            
            user = User.create(user_params)
            session[:user_id] = user.id
            redirect_to "/users/#{user.id}"
        else
            redirect_to "/"
        end
    end

    def show
        if session[:user_id] == params[:id].to_i
            @user = User.find(params[:id])
        else 
            redirect_to "/"
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :height, :tickets, :admin)
    end
end