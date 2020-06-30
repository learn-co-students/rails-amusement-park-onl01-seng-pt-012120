class AttractionsController < ApplicationController
    before_action :logged_in
    before_action :admin?
    skip_before_action :admin?, only: [:index, :show, :ride]

    def index
        @attractions = Attraction.all
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def show
        set_attraction
    end

    def edit
        set_attraction
    end

    def update
        set_attraction
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def destroy
        set_attraction
        Attraction.delete(@attraction.id)
        redirect_to attractions_path
    end

    def ride
        @ride = Ride.create(user_id: session[:user_id], attraction_id: params[:id])
        @message = @ride.take_ride
        flash[:notice] = @message
        redirect_to "/users/#{session[:user_id]}"
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :min_height, :nausea_rating, :happiness_rating)
    end

    def logged_in
        return head(:forbidden) unless session.include? :user_id
    end

    def admin?
        return head(:forbidden) unless User.find(session[:user_id]).admin
    end

    def set_attraction
        if params[:id].to_i != 0
        @attraction = Attraction.find(params[:id].to_i)
        end
    end

end
