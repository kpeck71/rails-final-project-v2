class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]

  def new
    @recipe = Recipe.new
    5.times{@recipe.ingredients.build}
  end

  def create
    @recipe = Recipe.new(recipe_params)
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
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :user_id, :instructions, categories_attributes: [:name], category_ids: [], ingredients_attributes: [:name])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # def set_category
  #   #raise recipe_params.inspect
  #   if params[:recipe][:categories] != nil
  #     #category = Category.find_or_create_by(name: params[:recipe][:categories][:name])
  #     category = Category.find_or_create_by(recipe_params[:categories])
  #     @recipe.categories << category
  #     @recipe.save
  #   end
  #end

end
