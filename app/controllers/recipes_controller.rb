class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]

  def new
    @recipe = Recipe.new
    5.times{@recipe.ingredients.build}
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if params[:recipe][:categories]
      set_category
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
  end

  def edit
  end

  def update
    set_category
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :user_id, :instructions, category_ids: [], ingredients_attributes: [:name])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_category
    category = Category.find_or_create_by(name: params[:recipe][:categories][:name])
    @recipe.categories << category
    @recipe.save
  end

end
