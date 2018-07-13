class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
    render json: @categories
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
