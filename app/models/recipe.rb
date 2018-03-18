class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :category_recipes
  has_many :categories, through: :category_recipes

  def ingredients_attributes=(ingredients_attributes)
    raise ingredients_attributes.inspect
    ingredients_attributes.values.each do |ingredient_attribute|
       ingredient = Ingredient.find_or_create_by(ingredient_attribute)
       self.ingredients.build(ingredient_attribute)
    end
  end
end
