class AttractionsController < ApplicationController
	before_action :require_admin
	skip_before_action :require_admin, only: [:index, :show]
	before_action :set_attraction, only: [:show, :edit, :update, :destroy]
	

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
		@attraction = Attraction.find(params[:id])
		@ride = Ride.new
	end

	def edit
	end

	def update
		@attraction.update(attraction_params)
		redirect_to attraction_path(@attraction)
	end

	def destroy
	end

	private

	def attraction_params
		params.require(:attraction).permit(
			:name,
			:min_height,
			:happiness_rating,
			:nausea_rating,
			:tickets)
	end

	def require_admin
		redirect_to attractions_path, notice: "You are not an admin." unless current_user.admin
	end

	def set_attraction
		@attraction = Attraction.find(params[:id])
	end
end
