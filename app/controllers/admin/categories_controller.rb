class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: [:upate, :destroy]

  def index
    @categories = Category.all

    if params[:id]
      set_category
    else
      @category = Category.new
    end
  end

  def create
    @category = Category.create(category_params)

    if @category.save
      redirect_to admin_categories_path
      flash[:notice] = "category was successfully created"
    else
      @categories = Category.all # render to index, but not has categories instance, so must be set.
      render :index
      flash[:alert] = "category was failed to created"
    end
  end

  def update
    # @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path
      flash[:notice] = "category was successfully updated"
    else
      @categories = Category.all
      render :index
    end
  end

  def destroy
    # @category = Category.find(params[:id])
    @category.destroy
    flash[:alert] = "category was successfully deleted"
    redirect_to admin_categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
