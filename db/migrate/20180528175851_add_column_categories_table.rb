class AddColumnCategoriesTable < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :recipes_count, :integer, :default => 0
    Category.reset_column_information
    Category.all.each do |u|
      Category.update_counters u.id, :recipes_count => u.recipes.length
    end
  end
end
