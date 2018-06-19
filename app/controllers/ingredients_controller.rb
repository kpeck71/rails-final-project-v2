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
    @recipe = params[:recipe_id]
    # @recipe_ingredient.recipe.id
    @ingredient = params[:id]
  end

  def create
    @recipe_ingredient = RecipeIngredient.find_or_create_by(ingredient_id: params[:id], recipe_id: params[:recipe_id])
    @recipe = params[:recipe_id]
    # @recipe_ingredient.recipe.id
    @ingredient = params[:id]
  end

  def update
    @recipe_ingredient = RecipeIngredient.find_or_create_by(ingredient_id: params[:id], recipe_id: params[:recipe_id])
    @recipe_ingredient.notes = params[:recipe_ingredient][:notes]
    @recipe_ingredient.save
    redirect_to edit_recipe_path(@recipe_ingredient.recipe.id)
  end

  def sort_ABC
    @ingredients = Ingredient.sort_ABC
    render :index
  end
end
