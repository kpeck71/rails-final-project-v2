class RecipeIngredientsController < ApplicationController
  before_action :set_recipe_ingredient, only: [:index, :show, :edit, :update]

  def index
    @recipe = Recipe.find(params[:id])
  end

  def show
    @recipe_ingredient = RecipeIngredient.find(params[:id])
  end

  def update
    @recipe_ingredient.update(recipe_ingredient_params)
    if @recipe_ingredient.save
      redirect_to recipe_path(@recipe_ingredient.recipe)
    end
  end

  private

  def set_recipe_ingredient
    @recipe_ingredient = RecipeIngredient.find(params[:id])
  end

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:notes)
  end
end
