class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  validates :name, presence: true, uniqueness: true

  scope :sort_ABC, -> { order("NAME ASC")};
  
end
