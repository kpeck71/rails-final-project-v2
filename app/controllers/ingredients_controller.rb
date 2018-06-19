class IngredientsController < ApplicationController
  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def sort_by_popularity
    @ingredients = Ingredient.sort_by_popularity
    raise @ingredients.inspect
    render :index
  end

  def edit
    @recipe_ingredient = RecipeIngredient.find_or_create_by(ingredient_id: params[:id], recipe_id: params[:recipe_id])
  end

  def sort_ABC
    @ingredients = Ingredient.sort_ABC
    render :index
  end
end
