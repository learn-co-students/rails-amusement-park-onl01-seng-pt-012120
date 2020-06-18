module ApplicationHelper
	def display_admin(user)
		if user.admin
			"ADMIN"
		end
	end

	def logged_in?
		!!current_user
	end

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
end
