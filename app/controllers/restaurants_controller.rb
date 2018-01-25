class RestaurantsController < ApplicationController

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

  #feeds
  def feeds
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)    
  end
end
