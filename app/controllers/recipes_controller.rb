class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]

  def index
    if params[:search]
      @recipes = Recipe.search(params[:search])
    else
      @recipes = Recipe.all
    end
  end

  def new
    if current_user
      @recipe = Recipe.new
      10.times{@recipe.ingredients.build}
    else
      redirect_to root_path
      flash[:notice] = "Only logged-in users can create recipes."
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
      flash[:notice] = "Recipe successfully created!"
    else
      redirect_to new_recipe_path
      flash[:alert] = @recipe.errors.full_messages
    end

  end

  def show
    if !logged_in?
      redirect_to root_path
      flash[:notice] = "Only logged-in users can see full recipes."
    end
  end

  def edit
    if @recipe.user == current_user
      5.times{@recipe.ingredients.build}
    else
      redirect_to root_path
      flash[:notice] = "You are not authorized to edit another user's recipe."
    end

  end

  def update
    @recipe.update(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'edit'
      # flash[:notice] = "There is an error here."
    end
  end

  def create_category
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :user_id, :instructions, categories_attributes: [:name], category_ids: [], ingredients_attributes: [:name])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end
