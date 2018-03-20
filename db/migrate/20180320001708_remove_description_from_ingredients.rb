class RemoveDescriptionFromIngredients < ActiveRecord::Migration[5.1]
  def change
    remove_column :ingredients, :description
  end
end
