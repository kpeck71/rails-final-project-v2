class Category < ApplicationRecord
  has_many :category_recipes
  has_many :recipes, through: :category_recipes
  validates :name, presence: true

   #scope :sort_by_popularity, ->
   scope :sort_ABC, -> { order("NAME ASC")}

   def recipe_count
     self.recipes.count
   end

   def self.sort_by_popularity
     @categories = Category.all.each do |category|
       category.recipe_count
     end
     @categories.sort
   end

end
