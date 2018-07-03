class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def sort_by_popularity
    @ingredients = Ingredient.sort_by_popularity
    render :index
  end

  def sort_ABC
    @ingredients = Ingredient.sort_ABC
    render :index
  end
end
