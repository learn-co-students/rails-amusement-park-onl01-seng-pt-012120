class SessionsController < ApplicationController
    def new
    end
  
    # def create
    #   return redirect_to(controller: 'sessions',
    #                      action: 'new') if !params[:name] || params[:name].empty?
    #   session[:name] = params[:name]
    #   redirect_to controller: 'application', action: 'hello'
    # end
  
    # def destroy
    #   session.delete :name
    #   redirect_to controller: 'application', action: 'hello'
    # end


    def create
        session[:user_id] = params[:user][:id]
        redirect_to user_path(User.find(params[:user][:id]))
        # redirect_to controller: 'session', action: 'new'
    # end
  end

  def destroy
    session.destroy 
    redirect_to root_path
  end
end


