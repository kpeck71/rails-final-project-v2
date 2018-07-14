class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @recipes = @category.recipes
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @recipes, status: 200 }
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

end
