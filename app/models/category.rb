class Category < ApplicationRecord
  has_many :category_recipes
  has_many :recipes, through: :category_recipes
  validates :name, presence: true
  validates_uniqueness_of :name

  scope :sort_by_popularity, -> { joins(:recipes)
    .select("categories.*", "COUNT(recipes.id) AS recipes_count")
    .group(:category_id)
    .order("recipes_count DESC")
  }
   scope :sort_ABC, -> { order("NAME ASC")}

end
