class RestaurantsController < ApplicationController
  # user login 
  before_action :authenticate_user!

  # index
  def index
    @restaurants = Restaurant.page(params[:page]).per(12)
    @categories = Category.all
  end

  #show
  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new # new a comment instance
  end
end
