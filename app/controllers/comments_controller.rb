class CommentsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id]) # find which the restaurant is commented
    @comment = @restaurant.comments.build(comment_params) # strong params
    @comment.user = current_user                          # get the user id
    @comment.save!
    redirect_to restaurant_path(@restaurant)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
