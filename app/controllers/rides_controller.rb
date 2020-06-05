class RidesController < ApplicationController

    def create
        ride = Ride.create(user_id: session[:user_id], attraction_id: params[:attraction_id])
        @message = ride.take_ride
        @attraction = Attraction.find(params[:attraction_id])
        redirect_to user_path(current_user), flash: {notice: @message}
    end
        
    

end
