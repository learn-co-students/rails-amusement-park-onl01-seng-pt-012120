class AttractionsController < ApplicationController
    before_action :find_attraction, only: [:show, :edit, :update]

    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find(params[:id])
        @user = User.find_by(:id => session[:user_id])
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attr_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            redirect_to new_attraction_path
        end
    end

    def edit
    end

    def update
        @attraction.update(attr_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            redirect_to edit_attraction_path(@attraction)
        end
    end

    def destroy
    end

    private

    def attr_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end

    def find_attraction
        @attraction = Attraction.find(params[:id])
    end

end