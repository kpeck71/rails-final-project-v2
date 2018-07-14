class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @recipes = @category.recipes
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @recipes, status: 200 }
    end
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      render json: @category
    end
  end


  def sort_by_popularity
    @categories = Category.sort_by_popularity
    render :index
  end

  def sort_ABC
    @categories = Category.sort_ABC
    render :index
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
