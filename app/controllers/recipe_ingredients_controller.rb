class RecipeIngredientsController < ApplicationController
  before_action :set_recipe_ingredient, only: [:show, :destroy]

  def index
    @recipe = Recipe.find(params[:id])
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @recipe }
	  end
  end

  # Video: Fix redirect when new ingredient is added

  def new
    @recipe = Recipe.find_by(params[:id])
  end

  def show
    @recipe_ingredient = RecipeIngredient.find(params[:id])
  end

  def update
    @recipe_ingredient = RecipeIngredient.find(params[:id])
    @recipe_ingredient.update(recipe_ingredient_params)
    render "update"
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
