class RidesController < ApplicationController
    before_action :user_layout

    def create
        #byebug
        @ride = Ride.create(attraction_id: params[:attraction_id], user_id: params[:user_id])
        message = @ride.take_ride
        flash[:notice] = message
        redirect_to user_path(@user)
    end
end