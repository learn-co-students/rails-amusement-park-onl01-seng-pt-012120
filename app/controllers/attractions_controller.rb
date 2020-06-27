class AttractionController < ApplicationController
    
    def index
        @attractions = Attraction.all 
        @user = current_user 
    end 
    
    
    def new
        @attraction = Attraction.new
    end
    
    def create
        @attraction = Attraction.new(params[:attraction_params])
        if @user.save
            session[:user_id]= @user.id
          redirect_to @attraction_path(@attraction), :alert => "you Signed up"
        else
          # This line overrides the default rendering behavior, which
          # would have been to render the "create" view.
          render "new", :alert => "Please complete the forms"
        end
    end
    
    
    def edit
        @attraction = Attraction.find(params[:id])
    end
    
    def update
        @attraction = Attraction.find(params[:id])
        if @attraction.update(user_params)
        redirect_to user_path(@attraction), :alert=> "UPDATE!"
        else
            render 'edit', :alert=>"Please complete the forms"
    end
    end
    
    
    
    def show
        @attraction = Attraction.find(params[id])
        @user = current_user
    end
    
    private
    
    
    # ["name", "nausea_rating", "happiness_rating", "tickets", "min_height"],
    def attraction_params
        params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
      end
    end