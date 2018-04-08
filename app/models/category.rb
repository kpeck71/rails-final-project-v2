class Category < ApplicationRecord
  has_many :category_recipes
  has_many :recipes, through: :category_recipes
  validates :name, presence: true

   scope :sort_by_popularity, -> { order("RECIPE_COUNT ASC")}
   scope :sort_ABC, -> { order("NAME DESC")}

   def recipe_count
     self.recipes.count
   end

end
