class SessionsController < ApplicationController
    layout "application"

    def new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render "new", notice: "Name or password is wrong"
        end
    end

    def destroy
        session.delete :user_id
        redirect_to "/"
    end
end