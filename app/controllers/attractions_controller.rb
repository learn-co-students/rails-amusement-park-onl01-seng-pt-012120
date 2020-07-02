class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = current_user
    @attraction = Attraction.new
  end