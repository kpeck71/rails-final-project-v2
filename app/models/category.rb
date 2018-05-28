class Category < ApplicationRecord
  has_many :category_recipes
  has_many :recipes, through: :category_recipes
  validates :name, presence: true

   scope :sort_by_popularity, -> { order("categories.recipes_count DESC").limit(1) }
   scope :sort_ABC, -> { order("NAME ASC")}


   # def self.sort_by_popularity
   #   Category.order("categories.recipes_count DESC").limit(1)
   # end

#array.max_by { |i| array.count(i) }


end
