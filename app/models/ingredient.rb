class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  validates :name, presence: true, uniqueness: true


  scope :sort_by_popularity, -> { joins(:recipes)
    .select("ingredients.*", "COUNT(recipes.id) AS recipes_count")
    .group(:ingredient_id)
    .order("recipes_count DESC")
  }

  scope :sort_ABC, -> { order("NAME ASC")}

end
