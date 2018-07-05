class RecipeIngredientsController < ApplicationController
  before_action :set_recipe_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.find(params[:id])
    render :new
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

  def destroy
    @recipe_ingredient.destroy
    redirect_to recipe_path(@recipe_ingredient.recipe)
  end

  private

  def set_recipe_ingredient
    @recipe_ingredient = RecipeIngredient.find(params[:id])
  end

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:notes)
  end
end
