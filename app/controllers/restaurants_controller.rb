class RestaurantsController < ApplicationController

  # index
  def index
    @restaurants = Restaurant.page(params[:page]).per(12)
    @categories = Category.all
  end

  # show
  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new # new a comment instance
  end

  # feeds
  def feeds
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)    
  end

  def ranking
    #@restaurant = Restaurant.find(params[:id])
    #@favorites_count = restaurant
  end

  # dashboard
  def dashboard
    @restaurant = Restaurant.find(params[:id])
  end

  # favorite
  def favorite
    @restaurant = Restaurant.find(params[:id])
    @restaurant.favorites.create!(user: current_user)
    @restaurant.count_favorites
    redirect_back(fallback_location: root_path)  # Redirect to last page, if fail to root page
  end

  # unfavorite
  def unfavorite
    @restaurant = Restaurant.find(params[:id])
    @favorites = Favorite.where(user: current_user, restaurant: @restaurant)
    @favorites.destroy_all
    @restaurant.count_favorites
    redirect_back(fallback_location: root_path)  # Redirect to last page, if fail to root page
  end

  # like
  def like
    @restaurant = Restaurant.find(params[:id])
    @restaurant.likes.create!(user: current_user)
    redirect_back(fallback_location: root_path)  # Redirect to last page, if fail to root page
  end

  # unlike
  def unlike
    @restaurant = Restaurant.find(params[:id])
    @likes = Like.where(user: current_user, restaurant: @restaurant)
    @likes.destroy_all
    redirect_back(fallback_location: root_path)  # Redirect to last page, if fail to root page
  end

end
