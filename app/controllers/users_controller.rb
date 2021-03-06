class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @commented_restaurants = @user.restaurants
    @favorited_restaurants = @user.favorited_restaurants
    @followings = @user.followings
    @followers = @user.followers
  end

  def edit
    @user = User.find(params[:id])

    if @user.id != current_user.id
      render :show
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
      flash[:notice] = "Profile was successfully updated"
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :intro, :avator)
  end
end
