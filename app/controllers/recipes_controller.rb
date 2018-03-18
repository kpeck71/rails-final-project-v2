class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    3.times{@recipe.ingredients.build}
  end
end
