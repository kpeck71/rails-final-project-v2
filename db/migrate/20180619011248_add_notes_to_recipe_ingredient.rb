class AddNotesToRecipeIngredient < ActiveRecord::Migration[5.1]
  def change
    add_column :recipe_ingredients, :notes, :text
  end
end
