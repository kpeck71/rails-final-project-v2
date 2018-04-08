class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  def sort_by_popularity
    @categories = Category.sort_by_popularity
    render :index
  end

  def sort_ABC
    @categories = Category.order('name DESC')
    render :index
  end
end
