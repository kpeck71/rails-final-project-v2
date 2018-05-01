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
     @cats = Category.all
     @cats.map{|category| [category.recipe_count, category.name]}
     #=> [[0, "Italian"], [0, "Vietnamese"], [2, "American"], [1, "New Category"], [0, ""],
     #[1, "Mexican"], [1, "Chinese"], [1, "Russian"], [1, "Greek"], [1, "Cajun"]]
   end

#array.max_by { |i| array.count(i) }


end
