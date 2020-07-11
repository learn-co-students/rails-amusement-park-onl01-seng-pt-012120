class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :user_layout

  def user_layout
    @user = User.find_by(id: session[:user_id])
  end
end
