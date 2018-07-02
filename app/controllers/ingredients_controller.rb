class IngredientsController < ApplicationController
  def index
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def sort_by_popularity
    @ingredients = Ingredient.sort_by_popularity
    raise @ingredients.inspect
    render :index
  end

  def sort_ABC
    @ingredients = Ingredient.sort_ABC
    render :index
  end
end
