class RidesController < ApplicationController
    before_action :login_required

    def create
        ride = Ride.create(:user_id => current_user.id, :attraction_id => params[:attraction_id])

        if ride
            msg = ride.take_ride
            flash[:ride_message] = msg

            redirect_to user_path(current_user)
        else
            redirect_to attraction_path(ride.attraction)
        end
    end

end