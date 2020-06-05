class AttractionsController < ApplicationController
    before_action :set_attraction, only: [:show,:edit,:update]
    before_action :set_current_user, only: [:index,:new,:show]
    
    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.valid?
            @attraction.save
            redirect_to attraction_path(@attraction)
        else
            render :new
        end
    end

    def edit
    end

    def update
        attraction = Attraction.new(attraction_params)
        if attraction.valid?
            @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        else
            render :edit
        end
    end
    
    def index
        @attractions = Attraction.all
    end

    def show
    end


    private

    def set_current_user
        @user = current_user
    end

    def set_attraction
        @attraction = Attraction.find_by(id: params[:id])
    end

    def attraction_params
        params.require(:attraction).permit(:name,:min_height,:happiness_rating,:nausea_rating,:tickets)
    end

end
