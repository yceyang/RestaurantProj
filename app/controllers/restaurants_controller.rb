class RestaurantsController < ApplicationController
  # user login 
  #before_action :authenticate_user!

  # index
  def index
    @restaurants = Restaurant.page(params[:page]).per(12)
  end

  #show
  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
