class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    5.times{@recipe.ingredients.build}
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if params[:recipe][:categories]
      category = Category.find_or_create_by(name: params[:recipe][:categories][:name])
      @recipe.categories << category
    end
    if @recipe.save
      #raise @recipe.inspect
      redirect_to @recipe
      #redirect_to recipe_path(@recipe)
    else
      raise @recipe.errors
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :user_id, :category_ids => [], ingredients_attributes: [:name, :description])
  end

end
