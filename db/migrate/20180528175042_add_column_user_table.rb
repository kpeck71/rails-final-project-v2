class AddColumnUserTable < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :recipes_count, :integer, :default => 0
    User.reset_column_information
    User.all.each do |u|
      User.update_counters u.id, :recipes_count => u.recipes.length
    end
  end
end
