class RestaurantsController < ApplicationController
  # user login 
  #before_action :authenticate_user!

  # index
  def index
    @restaurants = Restaurant.page(params[:page]).per(12)
    @counter = 0
  end
end
